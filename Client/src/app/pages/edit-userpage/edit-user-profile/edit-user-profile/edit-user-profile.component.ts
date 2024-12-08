import {AfterViewInit, ChangeDetectorRef, Component, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {AbstractControl, FormArray, FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {EditUserProfileService} from '../edit-user-profile.service';
import {UserProfile} from 'src/app/shared/models/accounts';
import {ActivatedRoute, Router} from '@angular/router';
import {ToastrService} from "ngx-toastr";
import {TranslateService} from "@ngx-translate/core";

@Component({
  selector: 'app-edit-user-profile',
  templateUrl: './edit-user-profile.component.html',
  styleUrls: ['./edit-user-profile.component.scss'],
})
export class EditUserProfileComponent implements OnChanges, AfterViewInit, OnInit {
  rangeExp = new FormGroup({
    datestart: new FormControl<Date | null>(null),
    dateend: new FormControl<Date | null>(null),
  });

  rangeEdu = new FormGroup({
    datestart: new FormControl<Date | null>(null),
    dateend: new FormControl<Date | null>(null),
  });

  image = "../../../assets/images/logoEmpty.png";

  data!: UserProfile;
  private phonePattern = /^\d{3}-\d{3}-\d{3}$|^\d{3}\d{3}\d{3}$/; // accepts either 000-000-000 or 000000000 patterns

  public userProfileEditForm: FormGroup;

  public userProfileEditGridForm: FormGroup;

  public currentUserID: number = +this.route.snapshot.params['id'];
  public returnLink: string = `/user/${this.currentUserID}`

  constructor(
    private ref: ChangeDetectorRef,
    private editUserProfileService: EditUserProfileService,
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private toastrService: ToastrService,
    private translate: TranslateService
  ) {

    this.userProfileEditGridForm = this.formBuilder.group({
      adress: ['', [Validators.required]],
      phone: ['', [Validators.pattern(this.phonePattern)]],
      salarymin: [3000, [Validators.required]],
      salarymax: [15000, [Validators.required]],
      // email: ['', [Validators.required]],
      dateOfBirth: ['', [Validators.required]],
      workingTime: ['', [Validators.required]],
      gitHub: ['', [Validators.required]],
      linkedIn: ['', [Validators.required]],
      site: ['', [Validators.required]],
    });

    this.userProfileEditForm = this.formBuilder.group({
      name: ['', [Validators.required]],
      surname: ['', [Validators.required]],
      position: ['', [Validators.required]],
      aboutMe: ['', []],
      // languages: [[], []],
      education: this.formBuilder.array([]),
      experience: this.formBuilder.array([]),
      certificates: this.formBuilder.array([]),
      organizationsAndSkills: this.formBuilder.array([]),
    });
  }

  ngOnInit(): void {
    !(this.currentUserID === +localStorage.getItem('userID')!) && this.router.navigate([`/user/${localStorage.getItem('userID')}`]); //if user tries to change ID in url
  }

  ngAfterViewInit(): void {
    this.getData();
    this.ref.detectChanges();
  }

  ngOnChanges(changes: SimpleChanges): void {
  }

  private getData() {
    this.editUserProfileService.getUserById(this.currentUserID).subscribe(res => {
      this.data = res.methodResult;

      this.organizationsAndSkills.clear();
      this.data.accountSoftSkills.forEach(data => {
        const x = this.formBuilder.group({
          id: [data.id],
          idaccount: [this.currentUserID],
          idaccountsoftskillstitle: [data.idaccountsoftskillstitle],
          createdat: null,
          idaccountNavigation: null,
          idaccountsoftskillstitleNavigation: null,
          name: [data.name]
        });
        this.organizationsAndSkills.push(x)
      })

      this.certificates.clear();
      this.data.accountCoursesCertificates.forEach(data => {
        const x = this.formBuilder.group({
          id: [data.id],
          idcertificate: null,
          idorganizationissuingcertificate: null,
          expirationdate: null,
          createdat: null,
          idaccountNavigation: null,
          idaccount: [this.currentUserID],
          certificatename: [data.certificatename],
          organizationissuingcertificate: [data.organizationissuingcertificate],
          certificatenumber: [data.certificatenumber],
          certificateissuedate: [data.certificateissuedate]
        });
        this.certificates.push(x)
      })

      this.experience.clear();
      this.data.accountWorkExperiences.forEach(data => {
        const x = this.formBuilder.group({
          id: [data.id],
          idprofession: null,
          profession: null,
          createdat: null,
          idaccountNavigation: null,
          idworkcompany: [data.idworkcompany],
          idaccount: [this.currentUserID],
          workcompany: [data.workcompany],
          datestart: [data.datestart],
          dateend: [data.dateend],
          accountworkresponsibilities: [[], []],

        });
        this.experience.push(x)
      })

      this.education.clear();
      this.data.accountEducationModelDto && this.data.accountEducationModelDto.forEach(data => {
        const x = this.formBuilder.group({
          id: [data.id],
          idprofession: null,
          createdat: null,
          iduniversityname: null,
          idprofessionaltitle: null,
          idaccountNavigation: null,
          idaccount: [this.currentUserID],
          professionname: [data.professionname],
          universityname: [data.universityname],
          professionaltitle: [data.professionaltitle],
          datestart: [data.datestart],
          dateend: [data.dateend],
        });
        this.education.push(x)
      })
      if (!this.data) return;

      this.image = this.data.account.image === null ? this.image : this.data.account.image;
      this.userProfileEditForm.setValue({
        name: this.data.account.name,
        surname: this.data.account.surname,
        position: this.data.account.position ? this.data.account.position : '',
        aboutMe: this.data.account.description,
        education: this.data.accountEducationModelDto,
        experience: this.data.accountWorkExperiences,
        certificates: this.data.accountCoursesCertificates,
        organizationsAndSkills: this.data.accountSoftSkills ? this.data.accountSoftSkills : []
      });
    })
  }

  keepOrder = (a: any, b: any) => {
    return a;
  };

  updateColor(progress: any) {
    if (progress < 50) {
      return 'warn';
    } else if (progress < 80) {
      return 'accent';
    } else {
      return 'primary';
    }
  }

  hasDropdown(input: string) {
    switch (input) {
      case 'Adres':
      case 'Widełki':
      case 'Strona':
      case 'Etat':
        return true;

      default:
        return false;
    }
  }

  getSkillLevel(value: number) {
    if (value === 100) return 'Native/C2';
    if (value < 100 && value >= 80) return 'C1';
    if (value === 0) return '';
    return 'Error';
  }

  public removeAtIndex(formControl: string, index: number) {
    switch (formControl) {
      case 'experience':
        return this.experience.removeAt(index);
      case 'certificates':
        return this.certificates.removeAt(index);
      case 'education':
        return this.education.removeAt(index)
    }
  }

  public deleteTasks(index: AbstractControl): void {
    this.organizationsAndSkills.removeAt(this.organizationsAndSkills.value.indexOf(index.value))
  }

  public createTask(): FormGroup {
    return this.formBuilder.group({
      taskName: ['', Validators.required]
    });
  }

  getTasks(item: AbstractControl): FormArray {
    return item.get('tasks') as FormArray;
  }

  addTask(item) {
    // // console.log(item.getRawValue().accountworkresponsibilities)
    // item.controls.accountworkresponsibilities.controls.push(this.formBuilder.group({
    //   name: ['', []]
    // }))
    // console.log("Temporary disabled")
  }

  public get experience() {
    return this.userProfileEditForm.get('experience') as FormArray;
  }

  public addExp() {
    this.experience.push(this.formBuilder.group({
      idaccount: [this.currentUserID, []],
      // idprofession: [0],
      idworkcompany: [0],
      workcompany: ['', []],
      datestart: new FormControl<Date | null>(null),
      dateend: new FormControl<Date | null>(null),
      accountworkresponsibilities: [[], []]
    }));
    this.ref.detectChanges();
  }

  public get education() {
    return this.userProfileEditForm.get('education') as FormArray;
  }

  addEdu() {
    this.education.push(this.formBuilder.group({
      idaccount: [this.currentUserID, []],
      professionname: ['', []],
      universityname: ['', []],
      professionaltitle: ['', []],
      datestart: new FormControl<Date | null>(null),
      dateend: new FormControl<Date | null>(null),
    }));
    this.ref.detectChanges();
  }

  public get certificates() {
    return this.userProfileEditForm.get('certificates') as FormArray;
  }

  addCert() {
    this.certificates.push(this.formBuilder.group({
      idaccount: [this.currentUserID, []],
      certificatename: ['', []],
      organizationissuingcertificate: ['', []],
      certificatenumber: ['', []],
      certificateissuedate: ['', []]
    }));
  }

  public get organizationsAndSkills() {
    return this.userProfileEditForm.get('organizationsAndSkills') as FormArray;
  }

  addNew(softSkillType: number) {
    switch (softSkillType) {
      case 1:
        this.organizationsAndSkills.push(this.formBuilder.group({
          idaccount: [this.currentUserID, []],
          idaccountsoftskillstitle: [1, []],
          name: ['', []]
        }));
        break;
      case 2:
        this.organizationsAndSkills.push(this.formBuilder.group({
          idaccount: [this.currentUserID, []],
          idaccountsoftskillstitle: [2, []],
          name: ['', []]
        }));
        break;
      case 3:
        this.organizationsAndSkills.push(this.formBuilder.group({
          idaccount: [this.currentUserID, []],
          idaccountsoftskillstitle: [3, []],
          name: ['', []]
        }));
        break;
    }
  }

  selectAvatar(event) {
    if (event.target.files) {
      let reader = new FileReader();
      reader.readAsDataURL(event.target.files[0]);
      reader.onload = (event: any) => {
        this.toastrService.warning(this.translate.instant('EditUserpage.Image uploaded'));
        this.image = event.target.result;
      }
    }
  }

  private accountDetails() {
    return (
      this.data.account.name = this.userProfileEditForm.value.name,
        this.data.account.surname = this.userProfileEditForm.value.surname,
        this.data.account.description = this.userProfileEditForm.value.aboutMe,
        this.data.account.location = this.userProfileEditGridForm.value.adress,
        this.data.account.image = this.image,
        this.data.account.birthdate = this.userProfileEditGridForm.value.dateOfBirth,
        // this.data.account.email = this.userProfileEditGridForm.value.email,
        this.data.account.phonenumber = this.userProfileEditGridForm.value.phone,
        this.data.account.salarymax = this.userProfileEditGridForm.value.salarymax,
        this.data.account.salarymin = this.userProfileEditGridForm.value.salarymin,
        this.data.account.employmentmethod = this.userProfileEditGridForm.value.workingTime
    )
  }

  public save() {
    this.accountDetails();
    // console.log('data', this.data)
    this.data.accountCoursesCertificates = this.userProfileEditForm.value.certificates;
    this.data.accountWorkExperiences = this.userProfileEditForm.value.experience;
    this.data.accountEducationModelDto = this.userProfileEditForm.value.education;
    this.data.accountSoftSkills = this.userProfileEditForm.value.organizationsAndSkills;
    this.data.accountWorkResponsibilities = [];
    this.editUserProfileService.updateUserById(this.data.account.id, this.data).subscribe(res => {
      if (res.isSuccess) {
        this.router.navigate([this.returnLink])
      }
    });
  }
}

import {ChangeDetectorRef, Component, OnDestroy} from '@angular/core';
import {
    FormBuilder,
    FormControl,
    FormGroup,
    Validators
} from "@angular/forms";
import {MatSnackBar} from "@angular/material/snack-bar";
import {INVALID, PASSWORD_LENGHT, VALID} from 'src/app/shared/constants/forms';
// import {LoginPopUpComponent} from "../login-pop-up/login-pop-up.component";
import {MatDialog} from "@angular/material/dialog";
import {AccountRegister, CompanyRegister} from 'src/app/shared/models/accounts';
import {ToastrService} from 'ngx-toastr';
import {TranslateService} from '@ngx-translate/core';
import {SHA256} from 'crypto-js';
import {ActivatedRoute, Router} from '@angular/router';
import {AccountService} from 'src/app/shared/services/user-service.service';
import {CompaniesPageComponent} from "../../pages/companiespage/companies-page.component";
import {CompanyPageService} from "../../pages/companiespage/companies-page.service";

@Component({
    selector: 'app-register-company-pop-up',
    templateUrl: './register-company-pop-up.component.html',
    styleUrls: ['./register-company-pop-up.component.scss']
})

export class RegisterCompanyPopUpComponent implements OnDestroy {

    labelPosition = "user";
    // registerUserFormGroup: FormGroup;
    public registerCompanyFormGroup: FormGroup;

    constructor(
        private _formBuilder: FormBuilder,
        private _snackBar: MatSnackBar,
        private popUp: MatDialog,
        private accountService: AccountService,
        private toastrService: ToastrService,
        private translate: TranslateService,
        private companiesPageComponent: CompaniesPageComponent,
        private companyProfileService: CompanyPageService,
    ) {
        // this.registerUserFormGroup = this._formBuilder.group({
        //   name: ['', [Validators.required, this.noSpaceAllowed]],
        //   surname: ['', [Validators.required, this.noSpaceAllowed]],
        //   email: ['', [Validators.required, Validators.email]],
        //   password: ['', [Validators.required, Validators.minLength(8)]],
        //   confirmPassword: ['', Validators.required],
        //   privacyCheckbox: ['', Validators.requiredTrue],
        // }, {validators: this.mustMatch('password', 'confirmPassword')});

        this.registerCompanyFormGroup = this._formBuilder.group({
            nameCompany: ['', [Validators.required, this.noSpaceAllowed]],
            nip: ['', [Validators.required, this.numeric]],
            headquarterAddress: ['', [Validators.required]],
            //password: ['', [Validators.required, Validators.minLength(8)]],
            //confirmPassword: ['', Validators.required],
            privacyCheckbox: ['', Validators.requiredTrue],
        });
    }

    ngOnDestroy(): void {
        this._snackBar.dismiss();
    }

    // get fUser() { return this.registerUserFormGroup.controls; }
    get fCompany() {
        return this.registerCompanyFormGroup.controls;
    }

    registerMessages(res: any) {
        this.toastrService.success(this.translate.instant('RegisterCompany.Company added successfully'))
        this.popUp.closeAll();
    }

    registerButtonCompany(formGroup: FormGroup) {
        if (formGroup.get('privacyCheckbox')?.status == INVALID) {
            // console.log('Polityka niezaznaczona');
            this.openSnackBar('Uwaga! W celu rejestracji należy zaakceptować regulamin wraz z polityką ochrony danych osobowych.');
        } else if (formGroup.status === VALID) {

            let companyModel: CompanyRegister = {
                nip: this.fCompany['nip'].value,
                name: this.fCompany['nameCompany'].value,
                headquarterAddress: this.fCompany['headquarterAddress'].value,
                idAccount: Number(localStorage.getItem('userID'))
            };

            // console.log('companyModel', companyModel);
            this.accountService.CompanyRegister(companyModel).subscribe(res => {
                this.registerMessages(res);

                setTimeout(() => {
                    window.location.reload(); // Odświeżanie strony po 3000 milisekundach (czyli 3 sekundach)
                }, 1000);
            });
        } else {
            // console.log('Invalid na formularzu');
        }
    }

    success() {
        this.toastrService.success('Message Success!', 'Title Success!');
    }


    getErrorPassword(pass: number) {
        let passwordLength = PASSWORD_LENGHT - pass;
        // if (this.registerUserFormGroup.get('password')?.hasError('minlength')) {
        //   return 'Brakuje ' + passwordLength + ' znaków';
        // }
        return false;
    }

    noSpaceAllowed(control: FormControl) {
        if (control.value != null && control.value.indexOf(' ') != -1) {
            return {noSpaceAllowed: true}
        }
        return false;
    }

    numeric(control: FormControl) {
        let val = control.value;

        if (val === null || val === '') return null;
        if (!val.toString().match(/^[0-9]+(\.?[0-9]+)?$/)) return {'invalidNumber': true};

        return null;
    }

    openSnackBar(message: string) {
        this._snackBar.open(message, '', {
            horizontalPosition: 'center',
            verticalPosition: 'bottom',
            duration: 2000,
        });
    }

    closeSnackBar() {
        // if (this.registerUserFormGroup.get('privacyCheckbox')?.status == 'VALID') {
        //   this._snackBar.dismiss();
        // }
    }

    openLogin() {
        this.popUp.closeAll();
        // this.popUp.open(LoginPopUpComponent);
    }
}

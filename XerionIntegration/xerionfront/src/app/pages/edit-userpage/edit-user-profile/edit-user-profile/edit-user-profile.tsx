<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
<main class="page">
  <div class="wrapperUser">
    <form [formGroup]="userProfileEditForm" class="sections">
      <div class="header">
        <a class="return-button" matTooltip="{{'UserPage.Return to profile' | translate}}">
          <button mat-raised-button type="button" routerLink="{{returnLink}}" color="accent">
            {{'UserPage.Return' | translate}}
          </button>
        </a>
        <a class="save-button">
          <button mat-raised-button type="button" (click)="save()" color="warn">{{'All.Save' | translate}}</button>
        </a>
        <div class="logo">
          <label class="custom-file-upload">
            <input type="file" (change)="selectAvatar($event)"/>
            <img class="avatar" alt="avatar" src="{{image}}">
          </label>
        </div>
        <span>
            <mat-form-field class="name-surname">
                <mat-label>{{'Login.Name' | translate}}</mat-label>
                <input matInput
                       placeholder="{{'Login.Name' | translate}}"
                       formControlName="name"
                >
            </mat-form-field>
            <mat-form-field class="name-surname">
                <mat-label>{{'Login.Surname' | translate}}</mat-label>
                <input matInput
                       placeholder="{{'Login.Surname' | translate}}"
                       formControlName="surname"
                >
            </mat-form-field>
        </span>
      </div>
      <!-- <div class="profesion">
        <mat-form-field appearance="outline" class="selector">
          <mat-label>Na co aplikujesz?</mat-label>
          <mat-select formControlName="position">
            <mat-option></mat-option>
            <mat-option value="Frontend">Frontend</mat-option>
            <mat-option value="Backend">Backend</mat-option>
          </mat-select>
        </mat-form-field>
      </div> -->
      <div class="info">
        <app-edit-user-profile-grid
          [data]="data"
          [form]="userProfileEditGridForm"
        >
        </app-edit-user-profile-grid>
      </div>
      <div class="about">
        <div class="sectionHeader">
          <mat-icon class="material-symbols-outlined">account_circle</mat-icon>
          <span>{{'UserPage.About me' | translate}}:</span>
        </div>
        <span>
            <mat-form-field class="about-me-field" appearance="outline">
                <mat-label>{{'EditUserpage.Tell us about yourself' | translate}}</mat-label>
                <textarea matInput
                          #aboutMe
                          maxlength="2000"
                          type="text"
                          placeholder="{{'EditUserpage.Tell us about yourself' | translate}}"
                          formControlName="aboutMe"
                          cdkTextareaAutosize
                ></textarea>
                <mat-hint align="end">{{aboutMe.value.length}}/2000</mat-hint>
            </mat-form-field>
        </span>
      </div>
      <!-- Disabled languages. Currently not handled. -->
      <!-- <div class="skills">
        <div class="sectionHeader">
          <mat-icon class="material-icons-outlined">translate</mat-icon>
          <span>Języki obce:</span>
        </div>
          <div class="masonryHolder">
            <div *ngFor="let lang of languages">
              <mat-form-field appearance="outline" class="masonryHolder-language">
                <mat-label>Wybierz język</mat-label>
                <mat-select formControlName="languages">
                    <mat-option></mat-option>
                    <mat-option *ngFor="let adress of languages" [value]="adress.language">{{adress.language}}</mat-option>
                  </mat-select>
              </mat-form-field>
              <mat-form-field appearance="outline" class="masonryHolder-level">
                <mat-label>Wybierz poziom</mat-label>
                <mat-select formControlName="languages">
                    <mat-option></mat-option>
                    <mat-option value="100">100</mat-option>
                    <mat-option value="80">80</mat-option>
                  </mat-select>
              </mat-form-field>
            </div>
            <div class="add-language">
              <mat-icon class="material-icons-outlined add-button" (click)="addLang()">add_circle_outline</mat-icon>
            </div>
          </div>
      </div> -->
      <div class="experience">
        <div class="section">
          <div class="sectionHeader">
            <mat-icon class="material-icons-outlined">work_outline</mat-icon>
            <span>{{'UserPage.Experience' | translate}}:</span>
          </div>
          <span>
          <mat-card formArrayName="experience" class="card"
                    *ngFor="let item of experience.controls | keyvalue; let i = index">
            <mat-card-content [formGroupName]="i"> <!-- Doświadczenie -->
              <div class="delete">
                <mat-icon class="material-icons-outlined"
                          (click)="removeAtIndex('experience', i)">delete_outline</mat-icon>
              </div>
              <div class="card-input-div" style="font-size: 12px;">
                <mat-form-field class="card-input">
                  <mat-label>Nazwa stanowiska</mat-label>
                  <input matInput
                         class="card-input-field"
                         placeholder="Nazwa stanowiska"
                         formControlName="workcompany"
                  >
                </mat-form-field>
              </div>
              <div>
                <mat-form-field>
                  <mat-label>Data od - do</mat-label>
                  <mat-date-range-input [rangePicker]="pickerExp">
                    <input matStartDate formControlName="datestart" placeholder="Start date">
                    <input matEndDate formControlName="dateend" placeholder="End date">
                  </mat-date-range-input>
                  <mat-datepicker-toggle matIconSuffix [for]="pickerExp"></mat-datepicker-toggle>
                  <mat-date-range-picker #pickerExp></mat-date-range-picker>

                  <mat-error
                    { rangeExp.controls.datestart.hasError('matStartDateInvalid') && (>Invalid start date</mat-error>
                  <mat-error
                    { rangeExp.controls.dateend.hasError('matEndDateInvalid') && (>Invalid end date</mat-error>
                </mat-form-field>
              </div>
              <!-- Temporary disabled work responsibility -->
              <!-- <div class="masonryHolder">
                <ul class="masonryBlocks" >
                  <li formArrayName="accountworkresponsibilities" *ngFor="let responsibility of item.value.accountworkresponsibilities; let ii = index">
                    <p [formGroupName]="ii">&#x2022;
                        <mat-form-field class="card-input">
                          <mat-label>Obowiązek</mat-label>
                          <input matInput
                            #inputField
                            class="card-input-field"
                            [matTooltip]="inputField.value"
                            placeholder="Obowiązek"
                            formControlName="name"
                          >
                        </mat-form-field>
                    </p>
                  </li>
                  <li class="masonryBlocks-add">
                    <mat-icon class="material-icons-outlined add-button" (click)="addTask(item)">add_circle_outline</mat-icon>
                  </li>
                </ul>
              </div> -->
            </mat-card-content>
          </mat-card>
        </span>
          <div class="add-under-cards">
            <mat-icon class="material-icons-outlined add-button" (click)="addExp()">add_circle_outline</mat-icon>
          </div>
        </div>
        <div class="section">
          <div class="sectionHeader">
            <mat-icon class="material-icons-outlined">school</mat-icon>
            <span>{{'UserPage.Education' | translate}}:</span>
          </div>
          <mat-card formArrayName="education" class="card"
                    *ngFor="let edu of education.controls | keyvalue; let i = index">
            <mat-card-content [formGroupName]="i"> <!-- Wykształcenie -->
              <div class="delete">
                <mat-icon class="material-icons-outlined" (click)="removeAtIndex('education', i)">delete_outline
                </mat-icon>
              </div>
              <div>
                <mat-form-field class="card-input">
                  <mat-label>Nazwa kierunku</mat-label>
                  <input matInput
                         class="card-input-field"
                         placeholder="Nazwa kierunku"
                         formControlName="professionname"
                  >
                  <!-- [value]="edu.name" -->
                </mat-form-field>
              </div>
              <div>
                <mat-form-field class="card-input">
                  <mat-label>Nazwa uczelni</mat-label>
                  <input matInput
                         class="card-input-field"
                         placeholder="Nazwa uczelni"
                         formControlName="universityname"
                  >
                  <!-- [value]="edu.school" -->
                </mat-form-field>
              </div>
              <div>
                <mat-form-field class="card-input">
                  <mat-label>Tytuł</mat-label>
                  <!-- [(value)]="edu.degree" -->
                  <input matInput
                         class="card-input-field"
                         placeholder="Tytuł"
                         formControlName="professionaltitle"
                  >
                </mat-form-field>
              </div>
              <div>
                <mat-form-field>
                  <mat-label>Data od - do</mat-label>
                  <mat-date-range-input [rangePicker]="pickerEdu">
                    <input matStartDate formControlName="datestart" placeholder="Start date">
                    <input matEndDate formControlName="dateend" placeholder="End date">
                  </mat-date-range-input>
                  <mat-datepicker-toggle matIconSuffix [for]="pickerEdu"></mat-datepicker-toggle>
                  <mat-date-range-picker #pickerEdu></mat-date-range-picker>

                  <mat-error { rangeExp.controls.datestart.hasError('matStartDateInvalid') && (>Invalid start date
                  </mat-error>
                  <mat-error { rangeExp.controls.dateend.hasError('matEndDateInvalid') && (>Invalid end date
                  </mat-error>
                </mat-form-field>
              </div>
            </mat-card-content>
          </mat-card>
          <div class="add-under-cards">
            <mat-icon class="material-icons-outlined add-button" (click)="addEdu()">add_circle_outline</mat-icon>
          </div>
        </div>
        <div class="section">
          <div class="sectionHeader">
            <mat-icon class="material-icons-outlined">approval</mat-icon>
            <span>{{'UserPage.Courses and certificates' | translate}}:</span>
          </div>
          <mat-card formArrayName="certificates" class="card"
                    *ngFor="let certificate of certificates.controls | keyvalue; let i = index">
            <div class="delete">
              <mat-icon class="material-icons-outlined" (click)="removeAtIndex('certificates', i)">delete_outline
              </mat-icon>
            </div>
            <mat-card-content [formGroupName]="i"> <!-- Kursy i Certyfikaty -->
              <div>
                <mat-form-field class="card-input">
                  <mat-label>Nazwa certyfikatu</mat-label>
                  <input matInput
                         class="card-input-field"
                         placeholder="Nazwa certyfikatu"
                         formControlName="certificatename"
                  >
                </mat-form-field>
              </div>
              <div>
                <mat-form-field class="card-input">
                  <mat-label>Numer certyfikatu</mat-label>
                  <input matInput
                         class="card-input-field"
                         placeholder="Numer certyfikatu"
                         formControlName="certificatenumber"
                  >
                </mat-form-field>
              </div>
              <div>
                <mat-form-field class="card-input">
                  <mat-label>Organizacja wydająca</mat-label>
                  <input matInput
                         class="card-input-field"
                         placeholder="Organizacja wydająca"
                         formControlName="organizationissuingcertificate"
                  >
                </mat-form-field>
              </div>
              <div>
                <mat-form-field appearance="outline" class="card-input">
                  <mat-label>Data wydania</mat-label>
                  <input matInput id="pickerHandDate" [matDatepicker]="pickerHandDate"
                         formControlName="certificateissuedate">
                  <mat-datepicker-toggle matIconSuffix [for]="pickerHandDate"></mat-datepicker-toggle>
                  <mat-datepicker #pickerHandDate></mat-datepicker>
                </mat-form-field>
              </div>
            </mat-card-content>
          </mat-card>
          <div class="add-under-cards">
            <mat-icon class="material-icons-outlined add-button" (click)="addCert()">add_circle_outline</mat-icon>
          </div>
        </div>
      </div>
      <div formArrayName="organizationsAndSkills" class="other">
        <div class="organizations">
          <div class="sectionHeader">
            <mat-icon class="material-icons-outlined">home</mat-icon>
            <span>Organizacje i stowarzyszenia:</span>
          </div>
          <div class="other-wraper">
            <ul class="other-block">
              <li *ngFor="let org of organizationsAndSkills.controls; let i = index">
                <p { org.value.idaccountsoftskillstitle === 1 && ( [formGroupName]="i">&#x2022;
                  <mat-form-field>
                    <mat-label>Organizacja</mat-label>
                    <input matInput
                           class="card-input-field"
                           placeholder="Organizacja"
                           formControlName="name"
                    >
                    <!-- [value]="org.name" -->
                  </mat-form-field>
                  <span class="delete-soft-skill">
                    <mat-icon class="material-icons-outlined"
                              (click)="deleteTasks(org)">delete_outline</mat-icon>
                  </span>
                </p>
              </li>
              <li class="other-add">
                <mat-icon class="material-icons-outlined add-button" (click)="addNew(1)">add_circle_outline</mat-icon>
              </li>
            </ul>
          </div>
        </div>
        <div class="organizations">
          <div class="sectionHeader">
            <mat-icon class="material-icons-outlined">mood</mat-icon>
            <span>Umiejętności miękkie:</span>
          </div>
          <div class="other-wraper">
            <ul class="other-block">
              <li *ngFor="let skill of organizationsAndSkills.controls; let i = index">
                <p { skill.value.idaccountsoftskillstitle === 2 && ( [formGroupName]="i">&#x2022;
                  <mat-form-field>
                    <mat-label>Umiejętność</mat-label>
                    <input matInput
                           class="card-input-field"
                           placeholder="Umiejętność"
                           formControlName="name"
                    >
                    <!-- [value]="skill.name" -->
                  </mat-form-field>
                  <span class="delete-soft-skill">
                    <mat-icon class="material-icons-outlined"
                              (click)="deleteTasks(skill)">delete_outline</mat-icon>
                  </span>
                </p>
              </li>
              <li class="other-add">
                <mat-icon class="material-icons-outlined add-button" (click)="addNew(2)">add_circle_outline</mat-icon>
              </li>
            </ul>
          </div>
        </div>
        <div class="organizations">
          <div class="sectionHeader">
            <mat-icon class="material-icons-outlined">fitness_center</mat-icon>
            <span>Hobby:</span>
          </div>
          <div class="other-wraper">
            <ul class="other-block">
              <li *ngFor="let hobby of organizationsAndSkills.controls; let i = index">
                <p { hobby.value.idaccountsoftskillstitle === 3 && ( [formGroupName]="i">&#x2022;
                  <mat-form-field>
                    <mat-label>Hobby</mat-label>
                    <input matInput
                           class="card-input-field"
                           placeholder="Hobby"
                           formControlName="name"
                    >
                    <!-- [value]="hobby.name" -->
                  </mat-form-field>
                  <span class="delete-soft-skill">
                    <mat-icon class="material-icons-outlined"
                              (click)="deleteTasks(hobby)">delete_outline</mat-icon>
                  </span>
                </p>
              </li>
              <li class="other-add">
                <mat-icon class="material-icons-outlined add-button" (click)="addNew(3)">add_circle_outline</mat-icon>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </form>
  </div>
</main>
 )) }

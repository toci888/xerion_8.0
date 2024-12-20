<div class="popup">
  <div class="wrapper">
    <div class="one">
      <span>Check </span>
      <img src="../../../../assets/icons/logo.svg" class="filter-logo" alt="logo"/>
      <span> Yourself</span>
    </div>
      <div class="three">
        <form [formGroup]="registerCompanyFormGroup" (ngSubmit)="registerButtonCompany(registerCompanyFormGroup)">
          <!--Nazwa firmy-->
          <mat-form-field appearance="fill">
            <input matInput placeholder="{{'Login.Company' | translate}}" formControlName="nameCompany">
            <mat-error { registerCompanyFormGroup.get('nameCompany')?.getError('required') && (>{{'Login.You must enter name of your company' | translate}}</mat-error>
            <mat-error { registerCompanyFormGroup.get('nameCompany')?.getError('noSpaceAllowed') && (>{{'Login.Space not allowed' | translate}}</mat-error>
          </mat-form-field>
          <!--NIP-->
          <mat-form-field appearance="fill">
            <input matInput placeholder="{{'Login.TIN' | translate}}" formControlName="nip">
            <mat-error { registerCompanyFormGroup.get('nip')?.getError('required') && (>{{'Login.You must enter your tax identification number' | translate}}</mat-error>
            <mat-error { registerCompanyFormGroup.get('nip')?.getError('invalidNumber') && (>{{'Login.Only numbers' | translate}}</mat-error>
          </mat-form-field>
          <!--Email-->
          <mat-form-field appearance="fill">
            <input matInput placeholder="{{'Login.Headquarter address' | translate}}" formControlName="headquarterAddress" >
            <mat-error { registerCompanyFormGroup.get('headquarterAddress')?.getError('required') && (>{{'Login.You must enter name headquoter location' | translate}}</mat-error>
          </mat-form-field>
          <!--Button submit-->
          <button mat-button class="registerButton"><span>{{'Login.Sign up' | translate}}</span></button>
          <!--Checkbox-->
          <mat-checkbox (click)="closeSnackBar()" formControlName="privacyCheckbox"><p>{{'Login.I accept protection policy' | translate}}</p></mat-checkbox>
        </form>
      </div>
  </div>
</div>
 )) }

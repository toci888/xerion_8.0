<div class="popup">
  <div class="wrapper">
    <div class="one">
      <span>Check </span>
      <img src="../../../../assets/icons/logo.svg" class="filter-logo" alt="logo"/>
      <span> Yourself</span>
    </div>
    <ng-container *ngIf="labelPosition === 'user';">
      <div class="three">
        <form [formGroup]="registerUserFormGroup" (ngSubmit)="registerButton(registerUserFormGroup)">
          
          <mat-form-field appearance="fill">
            <input matInput placeholder="{{'Login.Name' | translate}}" formControlName="name">
            <mat-error *ngIf="registerUserFormGroup.get('name')?.getError('required')">{{'Login.You must enter your name' | translate}}</mat-error>
            <mat-error *ngIf="registerUserFormGroup.get('name')?.getError('noSpaceAllowed')">{{'Login.Space not allowed' | translate}}</mat-error>
          </mat-form-field>
          
          <mat-form-field appearance="fill">
            <input matInput placeholder="{{'Login.Surname' | translate}}" formControlName="surname">
            <mat-error *ngIf="registerUserFormGroup.get('surname')?.getError('required')">{{'Login.You must enter your surname' | translate}}</mat-error>
            <mat-error *ngIf="registerUserFormGroup.get('surname')?.getError('noSpaceAllowed')">{{'Login.Space not allowed' | translate}}</mat-error>
          </mat-form-field>
          
          <mat-form-field appearance="fill">
            <input matInput placeholder="Email" formControlName="email" >
            <mat-error *ngIf="registerUserFormGroup.get('email')?.getError('required')">{{'Login.You must enter your Email' | translate}}</mat-error>
            <mat-error *ngIf="registerUserFormGroup.get('email')?.getError('email')">{{'Login.Wrong email' | translate}}</mat-error>
          </mat-form-field>
          
          <mat-form-field appearance="fill">
            <input #input matInput placeholder="{{'Login.Password min 8 characters' | translate}}" formControlName="password" type="password">
            <mat-error *ngIf="registerUserFormGroup.get('password')?.getError('required')">{{'Login.You must enter your password' | translate}}</mat-error>
            <mat-error *ngIf="registerUserFormGroup.get('password')?.invalid">{{getErrorPassword(input.value.length)}}</mat-error>
          </mat-form-field>
          
          <mat-form-field appearance="fill">
            <input matInput placeholder="{{'Login.Confirm password' | translate}}" formControlName="confirmPassword" type="password">
            <mat-error *ngIf="registerUserFormGroup.get('confirmPassword')?.getError('required')">{{'Login.You must enter your password' | translate}}</mat-error>
            <mat-error *ngIf="registerUserFormGroup.get('confirmPassword')?.getError('mustMatch')">{{'Login.Passwords does not match' | translate}}</mat-error>
          </mat-form-field>
          
          <button mat-button class="registerButton"><span>{{'Login.Sign up' | translate}}</span></button>
          
          <mat-checkbox (click)="closeSnackBar()" formControlName="privacyCheckbox"><p>{{'Login.I accept protection policy' | translate}}</p></mat-checkbox>
        </form>
      </div>
    </ng-container>
    <div class="five">{{'Login.You already have an accout' | translate}} <button class="buttonRegisterLogin" (click)="openLogin()">{{'Login.Log in' | translate}} </button></div>
  </div>
</div>

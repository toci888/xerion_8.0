<div class="popup">
  <div class="wrapper">
    <div class="one">
      <span>Check </span>
      <img src="../../../../assets/icons/logo.svg" class="filter-logo" alt="logo"/>
      <span> Yourself</span>
    </div>
    <div class="two">
      <div class="register">
        <span>{{'Login.Log in' | translate}}</span>
      </div>
    </div>
      <div class="three">
        <form [formGroup]="loginUserFormGroup" (ngSubmit)="loginButton(loginUserFormGroup)">
          <!--Email-->
          <mat-form-field appearance="fill">
            <input matInput placeholder="{{'Login.Email' | translate}}" formControlName="email">
            <mat-error { loginUserFormGroup.get('email')?.getError('required') && (>{{'Login.You must enter your Email' | translate}}</mat-error>
            <mat-error { loginUserFormGroup.get('email')?.getError('email') && (>{{'Login.Wrong email' | translate}}</mat-error>
          </mat-form-field>
          <!--Hasło-->
          <mat-form-field appearance="fill">
            <input #input matInput placeholder="{{'Login.Password' | translate}}" formControlName="password" type="password">
            <mat-error { loginUserFormGroup.get('password')?.getError('required') && (>{{'Login.You must enter your password' | translate}}</mat-error>
          </mat-form-field>
          <!--Button submit-->
          <button mat-button class="loginButton"><span>{{'Login.Log in' | translate}}</span></button>
        </form>
      </div>
    <div class="four">{{'Login.Forgot password' | translate}}</div>
    <div class="five">{{'Login.You do not have an account' | translate}}<button class="buttonRegisterLogin" (click)="openRegister()">{{'Login.Create an account' | translate}}</button></div>
  </div>
</div>
 )) }

<main>
  <div class="wrapperLanding">
    <div class="one">
      <mat-card class="register-card">
        <mat-card-header class="mat-card-header">
          <div class="icon1">
            <div class="outer-div">
              <mat-icon>show_chart</mat-icon>
              <span>{{'LandingPage.Increase your CV responses' | translate}}</span>
            </div>
          </div>
          <div class="icon2">
            <div class="outer-div">
              <mat-icon>quiz</mat-icon>
              <span>{{'LandingPage.Check yourself' | translate}}</span>
            </div>
          </div>
          <div class="icon3">
            <div class="outer-div">
              <mat-icon>search</mat-icon>
              <span>{{'LandingPage.Find an employee' | translate}}</span>
            </div>
          </div>
        </mat-card-header>
        <div class="border-bottom"></div>
        <mat-card-content>
          <h1>{{'LandingPage.Only' | translate}}<span> 5% </span>{{'LandingPage.Of IT ads are targetted to Juniors' | translate}}</h1>
          <h3>{{'LandingPage.Take up a challange' | translate}}</h3>
          <p>{{'LandingPage.Check your skill level' | translate}}</p>
          <p>{{'LandingPage.Apply and learn all in one' | translate}}</p>
          <p>{{'LandingPage.Let employer find you' | translate}}</p>
          <p>{{'LandingPage.Develop yourself' | translate}}</p>
        </mat-card-content>
        <mat-card-actions>
          <button *ngIf="!(localStorage.getItem('userID') && localStorage.getItem('userID') != 'undefined')" mat-button class="registerButton" (click)="openRegister()">
            <span>{{'LandingPage.Sign up' | translate}}</span></button>
        </mat-card-actions>
      </mat-card>
    </div>
  </div>
</main>

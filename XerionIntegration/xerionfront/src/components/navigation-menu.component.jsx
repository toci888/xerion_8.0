<mat-sidenav-container class="container" [hasBackdrop]="false">

  <mat-sidenav class="sidenav" #sidenav id="sidenav" mode="over" opened="{{navMenuToggle}}" position="end">
    <mat-nav-list class="sidenav-list">

      <mat-list-item class="sidenav-list-item" (click)="openLogin()">
        <span class="sidenav-item">
          <span class="icon"><mat-icon class="material-icons-outlined">account_circle</mat-icon></span>
          <span class="text">
            {{'NavigationMenu.My profile' | translate}}
          </span>
        </span>
      </mat-list-item>

      <mat-list-item class="sidenav-list-item" routerLink="/company" (click)="closeMenu()">
        <span class="sidenav-item">
          <span class="icon"><mat-icon class="material-icons-outlined">apartment</mat-icon></span>
          <span class="text">
            {{'NavigationMenu.Add/delete company' | translate}}
          </span>
        </span>
      </mat-list-item>










      <mat-list-item class="sidenav-list-item" routerLink="/quizzes" (click)="closeMenu()">
        <span class="sidenav-item-quiz">
          <span class="icon"><mat-icon class="material-icons-outlined">work</mat-icon></span>
          <span class="text">
          {{'NavigationMenu.MyJobOffers' | translate}}
            </span>
        </span>
      </mat-list-item>

        <mat-list-item class="sidenav-list-item" (click)="changeLanguage()">
        <span class="sidenav-item">
          <span class="icon"><mat-icon class="material-icons-outlined">language</mat-icon></span>
          <span class="text">
          {{'NavigationMenu.Change language' | translate}}
            </span>
        </span>
        </mat-list-item>

      <!-- <mat-list-item class="sidenav-list-item" routerLink="/quiz">
        <span class="sidenav-item-quiz">
          <span class="icon">
          <div class="changeLanguageButton" (click)="changeLanguage();" *ngIf="localStorage.getItem('selectedLanguage') !== 'pl'">
            <input type="image" src="../../../assets/icons/PL.svg"  alt="PL"/>
          </div>
          <div class="changeLanguageButton" (click)="changeLanguage();" *ngIf="localStorage.getItem('selectedLanguage') === 'pl'">
              <input type="image" src="../../../assets/icons/GB.svg"  alt="GB"/>
          </div>
        </span>
          {{'NavigationMenu.Language' | translate}}
        </span>
      </mat-list-item> -->

      <mat-list-item [class.sidenav-list-item-quiz-closed]="!isQuizDropdownActive" (click)="logout()">
        <span class="sidenav-end-item">
          <span class="text-bottom">
            {{'NavigationMenu.Logout' | translate}}
          </span>
        </span>
      </mat-list-item>

    </mat-nav-list>
  </mat-sidenav>

  <mat-sidenav-content class="content">
    <ng-content ></ng-content>
  </mat-sidenav-content>

</mat-sidenav-container>

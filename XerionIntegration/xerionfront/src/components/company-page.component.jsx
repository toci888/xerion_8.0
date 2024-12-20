<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
<main class="page">
  <div class="wrapperUser">
    <div class="sections">
      <div class="upheader">
        <a *ngIf="showEditButton" class="edit-button" matTooltip="{{'UserPage.Edit profile' | translate}}">
          <mat-icon class="material-symbols-outlined" routerLink="{{editCompanyLink}}">edit</mat-icon>
        </a>
      </div>
      <div class="header">
        <div class="left">
          <div class="logo">
            <img class="avatar" alt="avatar" src="{{company.image}}">
          </div>
          <div class="companyName">
            <div class="title">
              <span>{{company.name | capitalize}}</span>
            </div>
            <div class="icons">
              <ng-container *ngFor="let s of socials">
                <a *ngIf="s.link.length > 0 && checkPlatforms(s.name)" href="https://www.{{s.link}}">
                  <mat-icon class="add" svgIcon="{{s.name}}"></mat-icon>
                </a>
              </ng-container>
            </div>
          </div>
        </div>
        <div class="right">
          <mat-icon svgIcon="pin"></mat-icon>
          <span>{{company.location | capitalize}}</span>
          <mat-icon svgIcon="user"></mat-icon>
          <span>{{CompanySize[company.employeecount] || company.employeecount}}</span>
        </div>
      </div>
      <div class="about" *ngIf="company.about">
        <p>O mnie:</p>
        <p class="aboutInfo">{{company.about | capitalize}}</p>
      </div>
      <div class="technology" *ngIf="technology.length > 0">
        <p>Technologie:</p>
        <mat-grid-list cols="8" rowHeight="50px">
          <mat-grid-tile *ngFor="let icon of technology">
            <mat-icon matTooltip="{{icon.replace('icon','') | capitalize}}" svgIcon="{{icon}}"></mat-icon>
          </mat-grid-tile>
          <mat-grid-tile>
            
          </mat-grid-tile>
        </mat-grid-list>
      </div>
      <div class="tools" *ngIf="tools.length > 0">
        <p>Narzędzia:</p>
        <mat-grid-list cols="8" rowHeight="50px">
          <mat-grid-tile *ngFor="let icon of tools">
            <mat-icon matTooltip="{{icon.replace('icon','') | capitalize}}" svgIcon="{{icon}}"></mat-icon>
          </mat-grid-tile>
          <mat-grid-tile>
            
          </mat-grid-tile>
        </mat-grid-list>
      </div>
      <div class="platforms" *ngIf="platforms.length > 0">
        <p>Platformy:</p>
        <mat-grid-list cols="8" rowHeight="50px">
          <mat-grid-tile *ngFor="let icon of platforms">
            <mat-icon matTooltip="{{icon.replace('icon','') | capitalize}}" svgIcon="{{icon}}"></mat-icon>
          </mat-grid-tile>
          <mat-grid-tile>
            
          </mat-grid-tile>
        </mat-grid-list>
      </div>
      <div class="gallery" *ngIf="images.length > 0">
        <p>{{'EditUserpage.Photos' | translate}}:</p>
        <div>
          <div style="display: grid; grid-template-columns: repeat(8, 1fr); gap: 10px;">
            <div *ngFor="let a of images" class="container" style="grid-column: span 2; grid-row: span 1;">
              <img src="{{a || '../../../assets/images/logoEmpty.png'}}"
                   style="width: 100%; height: 100%; object-fit: cover;"/>
            </div>
          </div>
        </div>
      </div>
      <div class="map" *ngIf="offices.length > 0">
        <p>Nasze biura:</p>
        <div *ngFor="let office of offices">
          <iframe [src]="office | sanitizeUrl" width=100% height="400" frameborder="0"
                  style="border:0" allowfullscreen></iframe>
        </div>
      </div>
      <div class="jobOffers">
        <p>Oferty pracy:</p>
        <div class="offer" *ngFor="let offer of offers">
          <div class="left">
            <img class="avatar" alt="avatar" src="{{company.image}}">
            <div class="companyName">
              <div class="jobName" [routerLink]="'/joboffer/' + offer.id">
                <span>{{offer.jobName | capitalize}}</span>
              </div>
              <div>
                <span>{{company.name | capitalize}}</span>
              </div>
            </div>
          </div>
          <div class="center">
            <div class="tags">
              <ng-container *ngFor="let tag of offer.tags.slice(0, 4)">
                <div class="tag" *ngIf="tag !== ''">
                  {{ getTechName(tag) | capitalize }}
                </div>
              </ng-container>
            </div>
          </div>
          <div class="right">
            <p id="location">{{(offer.location ? offer.location : company.location) | capitalize}}</p>
            <div class="center">
              <button *ngIf="showEditButton && offer.quizid! > 0" mat-button class="applyButton" [routerLink]="'/joboffer/' + offer.id + '/applies'"><span>{{'NavigationMenu.View applies' | translate}}</span></button>
              <button *ngIf="showEditButton && (offer.quizid == 0 || offer.quizid == null)" mat-button class="applyButton" [routerLink]="'/joboffer/' + offer.id + '/create-quiz'"><span>{{'NavigationMenu.Add quizz' | translate}}</span></button>
              <button *ngIf="showEditButton" mat-button class="applyButton" (click)="deleteJobOffer(offer.id)"><span>{{'NavigationMenu.DeleteOffer' | translate}}</span></button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

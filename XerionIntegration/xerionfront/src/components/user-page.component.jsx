<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
<main class="page">
  <div class="wrapperUser">
    <div class="sections">
      <div class="header">
        <a *ngIf="showEditButton" class="edit-button" matTooltip="{{'UserPage.Edit profile' | translate}}">
          <mat-icon class="material-symbols-outlined" routerLink="{{editLink}}">edit</mat-icon>
        </a>
        <img class="avatar" alt="avatar" src="{{person.image}}">
        <span class="nameAndSurname">{{capitalizeEachWord(person.name)}}</span>
        <span>{{person.title | capitalize}}</span>
      </div>
      <div class="tags">
        <ng-container *ngFor="let tag of tags">
          <div class="tag" *ngIf="tag.info.length >= 1">
            #{{tag.info}}
          </div>
        </ng-container>
      </div>
      <div class="info">
        <mat-grid-list cols="3" rowHeight="50px">
          <div *ngFor="let info of informations">
            <mat-grid-tile *ngIf="info.text !== null && info.text.length > 0">
              <div class="text-inside-grid">
                <mat-icon class="material-symbols-outlined">{{ info.icon }}</mat-icon>
                {{ info.text | capitalize}}
              </div>
            </mat-grid-tile>
          </div>
        </mat-grid-list>
      </div>
      <div class="about" *ngIf="person.about">
        <div class="sectionHeader">
          <mat-icon class="material-symbols-outlined">account_circle</mat-icon>
          <span>{{'UserPage.About me' | translate}}:</span>
        </div>
        <span>{{person.about | capitalize}}</span>
      </div>
      <div class="skills" >
        <div class="sectionHeader" *ngIf="getSkillCategories().values[0]">
          <mat-icon class="material-symbols-outlined">computer</mat-icon>
          <span>{{'UserPage.Skills' | translate }}:</span>
        </div>
        <div class="masonryHolder">
          <ul class="masonryBlocks" *ngFor="let skillCategory of getSkillCategories()">
            <li class="title" *ngIf="skillCategory.value[0]">{{ skillCategory.key + ':' | capitalize }}</li>
            <ul>
              <li *ngFor="let skill of skillCategory.value">
                <div class="element">
                  <span>{{ skill.name }}</span>
                  <mat-progress-bar [color]="updateColor(skill.progress*100)" mode="determinate"
                                    [value]="skill.progress*100"></mat-progress-bar>
                  <span>{{ skill.progress * 100 + '%' }}</span>
                </div>
              </li>
            </ul>
          </ul>
        </div>
      </div>
      <div class="experience">
        <div class="section" *ngIf="experience">
          <div class="sectionHeader">
            <mat-icon class="material-symbols-outlined">work</mat-icon>
            <span>{{'UserPage.Experience' | translate}}:</span>
          </div>
          <ul class="sessions">
            <li *ngFor="let exp of experience">
              <div class="name">{{exp.name | capitalize}}</div>
              <div class="time">{{exp.time | capitalize}}</div>
              
            </li>
          </ul>
        </div>
        <div class="section" *ngIf="education">
          <div class="sectionHeader">
            <mat-icon class="material-symbols-outlined">school</mat-icon>
            <span>{{'UserPage.Education' | translate}}:</span>
          </div>
          <ul class="sessions">
            <li *ngFor="let edu of education">
              <div class="name">{{edu.name | capitalize}}</div>
              <div class="time">{{edu.time | capitalize}}</div>
              <div class="time">{{edu.school | capitalize}}</div>
            </li>
          </ul>
        </div>
        <div class="section" *ngIf="certificates">
          <div class="sectionHeader">
            <mat-icon class="material-symbols-outlined">approval</mat-icon>
            <span>{{'UserPage.Courses and certificates' | translate}}:</span>
          </div>
          <ul class="sessions">
            <li *ngFor="let cert of certificates">
              <div class="name">{{cert.name | capitalize}}</div>
              <div class="time">{{cert.time | capitalize}}</div>
              <div class="time">{{cert.cert | capitalize}}</div>
            </li>
          </ul>
        </div>
      </div>
      <div class="other">
        <div class="organizations" *ngFor="let other of other">
          <div class="sectionHeader">
            <mat-icon class="material-symbols-outlined">{{other.icon}}</mat-icon>
            <span>{{other.name }}:</span>
          </div>
          <ng-container *ngFor="let duties of other.duties">
            <p *ngIf="duties.length>0">&#x2022; {{duties | capitalize}}</p>
          </ng-container>
        </div>
      </div>
    </div>
  </div>
</main>

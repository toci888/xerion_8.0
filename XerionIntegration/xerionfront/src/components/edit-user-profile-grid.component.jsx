<form [formGroup]="form">
  <mat-grid-list cols="3" rowHeight="85px"> 
    <mat-grid-tile>
      <div>
        <mat-icon class="material-icons-outlined">pin_drop</mat-icon>
        <mat-form-field>
          <mat-label>{{'All.Address' | translate}}</mat-label>
          <input matInput
                 placeholder="{{'All.Address' | translate}}"
                 formControlName="adress"
                 type="text">
        </mat-form-field>
      </div>
    </mat-grid-tile>

    <mat-grid-tile>
      <div>
        <mat-icon class="material-icons-outlined">call</mat-icon>
        <mat-form-field>
          <mat-label>Numer Telefonu</mat-label>
          <input matInput
                 placeholder="Numer Telefonu"
                 formControlName="phone"
                 matTooltip="Pattern: 123-456-789 or 123456789"
                 [textMask]="{mask: phoneMask}"
          >
          <!-- pattern="[0-9]{3}-[0-9]{3}-[0-9]{3}"
          minlength="9"
          maxlength="14" -->
          <mat-error *ngIf="form.get('phone')?.getError('pattern')">Invalid Phone Number Pattern</mat-error>
        </mat-form-field>
      </div>
    </mat-grid-tile>

    <mat-grid-tile>
      <div>
        <mat-icon class="material-icons-outlined">payments</mat-icon>
        
        <mat-label>Widełki</mat-label>
        <div class="slider">
          <mat-slider min="0" max="20000" step="250" discrete>
            <input matSliderThumb formControlName="salarymin">
          </mat-slider>
        </div>

        
      </div>
    </mat-grid-tile>

    <!-- <mat-grid-tile>
      <div>
        <mat-icon class="material-icons-outlined">mail</mat-icon>
        <mat-form-field>
          <mat-label>Email</mat-label>
          <input matInput
                 #emailInput
                 placeholder="Email"
                 formControlName="email"
                 type="email"
                 [matTooltip]="emailInput.value"
          >
        </mat-form-field>
      </div>
    </mat-grid-tile> -->

    <mat-grid-tile>
      <div>
        <mat-icon class="material-icons-outlined">cake</mat-icon>
        <mat-form-field appearance="outline" class="date-picker">
          <mat-label>Data Urodzenia</mat-label>
          <input matInput [matDatepicker]="picker" formControlName="dateOfBirth">
          <mat-datepicker-toggle matIconSuffix [for]="picker"></mat-datepicker-toggle>
          <mat-datepicker #picker></mat-datepicker>
        </mat-form-field>
      </div>
    </mat-grid-tile>

    <mat-grid-tile>
      <div>
        <mat-icon class="material-icons-outlined">hourglass_top</mat-icon>
        <mat-form-field appearance="outline">
          <mat-label>Etat</mat-label>
          <mat-select formControlName="workingTime">
            <mat-option *ngFor="let key of getTypesWork()" [value]="key">
              {{ JobType[key] }}
            </mat-option>
          </mat-select>
        </mat-form-field>
      </div>
    </mat-grid-tile>

    <!-- <mat-grid-tile>
      <div>
        <mat-icon class="material-icons-outlined">link</mat-icon>
        <mat-form-field>
          <mat-label>Github</mat-label>
          <input matInput
                 placeholder="Github"
                 formControlName="gitHub"
                 type="text"
          >
        </mat-form-field>
      </div>
    </mat-grid-tile>

    <mat-grid-tile>
      <div>
        <mat-icon class="material-icons-outlined">link</mat-icon>
        <mat-form-field>
          <mat-label>LinkedIn</mat-label>
          <input matInput
                 placeholder="LinkedIn"
                 formControlName="linkedIn"
                 type="text"
          >
        </mat-form-field>
      </div>
    </mat-grid-tile>

    <mat-grid-tile>
      <div>
        <mat-icon class="material-icons-outlined">web</mat-icon>
        <mat-form-field>
          <mat-label>Strona</mat-label>
          <input matInput
                 placeholder="Strona"
                 formControlName="site"
                 type="text"
          >
        </mat-form-field>
      </div>
    </mat-grid-tile> -->

  </mat-grid-list>
</form>

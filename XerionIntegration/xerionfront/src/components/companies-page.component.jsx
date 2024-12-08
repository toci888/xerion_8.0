<!--<div class="topbar">
    Nie masz firmy?
    <button mat-flat-button color="warn" (click)="openRegister()">Dodaj</button>
</div>-->
<main class="page">
    <div class="wrapperUser">
        <div class="sections">
            <button mat-button class="newJobbButton" (click)="openRegister()"><span>{{'CompaniesPage.Add company' | translate}}</span></button>
            <div class="jobOffers">
                <div class="noOffers" *ngIf="false">
                    <span>{{'CompaniesPage.No offer' | translate}}</span>
                </div>
                <div class="offer" *ngFor="let offer of companies; let i = index">
                    <div class="left">
                        <a href="company/{{offer.id}}">
                            <img class="avatar" alt="avatar" src="{{offer.logo || '../../../assets/images/logoEmpty.png'}}">
                        </a>
                        <div class="companyName">
                            <div class="jobName">
                                <a href="company/{{offer.id}}">{{ offer.name | capitalize}}</a>
                            </div>
                        </div>
                    </div>
                    <div class="center">
                        <button mat-button class="applyButton" (click)="goToEditJob(offer.id)"><span>{{'CompaniesPage.Add job' | translate}}</span></button>
                        <button mat-button class="applyButton" (click)="goToEdit(offer.id)"><span>{{'All.Edit company' | translate}}</span></button>
                        <button mat-button class="applyButton" (click)="areYouSure(offer.id)"><span>{{'CompaniesPage.Delete' | translate}}</span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>


<!--<div class="company-list">
    <table mat-table [dataSource]="companies" class="mat-elevation-z8">


        <ng-container matColumnDef="companyName">
            <th mat-header-cell *matHeaderCellDef>Nazwa Firmy</th>
            <td mat-cell *matCellDef="let element">
                <div class="offer">
                    <a href="company/{{element.id}}">{{ element.name }}</a>
                    <button (click)="areYouSure(element.id)" mat-button class="deleteButton"><span>Usuń</span></button>
                </div>
            </td>
        </ng-container>



        <tr mat-header-row *matHeaderRowDef="displayedColumns"></tr>
        <tr mat-row *matRowDef="let row; columns: displayedColumns;"></tr>

    </table>

</div>
-->

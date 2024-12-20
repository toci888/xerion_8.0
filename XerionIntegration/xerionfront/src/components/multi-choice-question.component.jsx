<div class="quiz-main" #scrollTo>
    <form>
        <div *ngFor="let question of quiz.questions; let i = index">
            <mat-card *ngIf="question.type === 'multiple-choice' && i === questionNumber" class="main-card">
                <div class="question-text"  >
                    {{'Quiz.Question' | translate}}
                </div>
                    <mat-card-content class="question-content">
                            <h2>{{question.question}}</h2>
                        
                        <div>
                            {{question?.code}}
                        </div>
                        <div>
                            {{question?.picture}}
                        </div>
                        <div>
                            {{question?.film}}
                        </div>
                    </mat-card-content>
                    <mat-card-content>
                        <mat-grid-list cols="4" rowHeight="200px" class="list">
                            <mat-grid-tile *ngFor="let choice of options(question); let ii = index" class="grid-tile">
                                <mat-card class="card" (click)="toggleChoice(choice)" [class.card-selected]="isSelected(choice)">
                                    <mat-card-content class="card-content" [style.background-color]="colors[ii % colors.length]" [style.background-image]="backgroundImages[(ii % colors.length) % 8]">
                                        {{choice}}
                                    </mat-card-content>
                                </mat-card>
                            </mat-grid-tile>
                        </mat-grid-list>
                        <div class="next-question">
                            <button type="button" class="next-question-button" (click)="nextQuestion(question)">{{'Quiz.Prev Question' | translate}}</button>
                        </div>
                        <div class="next-question">
                            <button type="button" class="next-question-button" (click)="nextQuestion(question)">{{'Quiz.Next Question' | translate}}</button>
                        </div>
                    </mat-card-content>
            </mat-card>
        </div>
    </form>
</div>


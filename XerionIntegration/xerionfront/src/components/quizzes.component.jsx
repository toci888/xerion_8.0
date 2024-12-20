<div class="quiz-main" *ngIf="quiz">
    <div class="quiz-questions" *ngIf="isQuizToBeStarted; else showThis">
        
        
        
        <questions [quizz]="quiz"></questions>
        
    </div>
    <ng-template #showThis>
        <div class="navbar">
            <a>{{companyName | capitalize}} > {{jobOfferName | capitalize}} > {{quiz.quiz.name | capitalize}}</a>
        </div>
        
        <div class="background">
            <div class="wrapperUser">
                <div class="title">
                    <a>{{'Quiz.Welcome' | translate}}{{quiz.quiz.name | capitalize}} !</a>
                </div>
                <div class="desc">
                    <a *ngIf="quiz.quiz.description" class="description">{{quiz.quiz.description | capitalize}}</a>
                </div>

                <div class="line"></div>

                <div class="center">
                    <div class="quiz-info">
                        <span>{{'Quiz.Question_no' | translate}}<a>{{quiz.quizzesQuestions.length}}</a></span>
                        <span>{{'Quiz.Points_no' | translate}}<a>{{quiz.quiz.totalscore}}</a></span>
                        <span>{{'Quiz.Min' | translate}}<a>{{quiz.quiz.passingthreshold}}%</a></span>
                        <span>{{'Quiz.Time' | translate}}<a>{{quiz.quiz.totaltime}}</a></span>
                    </div>
                </div>

                <div class="end">
                    <button class="start" (click)="onStart()">{{'Quiz.Start Quiz' | translate}}</button>
                </div>
            </div>
        </div>
    </ng-template>
</div>

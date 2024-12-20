<div { !showResultScreen else resultScreen && (>
    <div class="header">
        <span class="header-question">{{'Quiz.Question' | translate}} {{questionNumber + 1}}/{{quiz.questions.length}}</span>
        <span class="header-time"><mat-icon class="material-icons-outlined hourglass">hourglass_top</mat-icon>{{ellapsedTime}} / {{totalTime}}</span>
    </div>
    <div { quiz.questions[questionNumber].type === 'single-choice' && (>
        <app-single-choice-question
            [colors]="colors"
            [quiz]="quiz"
            [questionNumber]="questionNumber"
            [backgroundImages]="backgroundImages"
            [questionImage]="questionImage"
            (questionChanged)="onQuestionChanged($event)"
        ></app-single-choice-question>
    </div> 
    <div { quiz.questions[questionNumber].type === 'multiple-choice' && (>
        <app-multi-choice-question
            [colors]="colors"
            [quiz]="quiz"
            [questionNumber]="questionNumber"
            [backgroundImages]="backgroundImages"
            [questionImage]="questionImage"
            (questionChanged)="onQuestionChanged($event)"
        ></app-multi-choice-question>
    </div> 
    <div { quiz.questions[questionNumber].type === 'multiple-select' && (>
        <app-complete-sentence-question
            [quiz]="quiz"
            [questionNumber]="questionNumber"
            (questionChanged)="onQuestionChanged($event)"
        ></app-complete-sentence-question>
    </div>

    <!-- <div class="button-container">
        <div class="next-question">
            <button type="button" class="next-question-button" (click)="nextQuestion(question)">{{'Quiz.Prev Question' | translate}}</button>
        </div>
        <div class="next-question">
            <button type="button" class="next-question-button" (click)="nextQuestion(question)">{{'Quiz.Next Question' | translate}}</button>
        </div>
    </div> -->
</div>
<ng-template #resultScreen>
    <div class="header">
        <span class="header-result"> {{'Quiz.Result of Quiz' | translate}}: {{quiz.title}}</span>
    </div>
    <div class="result-main">
        <mat-card class="main-card">
            <mat-card-content class="result-content-1">
                <div>
                    1 koniec
                </div>
            </mat-card-content>
            <mat-card-content class="result-content-2">
                <div>
                    2
                </div>
            </mat-card-content>
        </mat-card>
    </div>
</ng-template> )) }

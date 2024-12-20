<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
<main class="page">
    <div class="wrapperUser">
        <div class="sections">

            <form [formGroup]="quizForm" (ngSubmit)="submitQuiz()">
                <div class="head">
                    <label for="quizName">{{'QuizCreator.Name' | translate}}</label>
                    <div *ngIf="quizForm.get('quizName')?.hasError('required') && quizForm.get('quizName')?.touched"
                         class="error-message">
                         {{'QuizCreator.Namereq' | translate}}
                    </div>
                </div>
                <input id="quizName" type="text" formControlName="quizName" required>

                <div class="head">
                    <label for="maxDuration">{{'QuizCreator.Time' | translate}}</label>
                    <div *ngIf="quizForm.get('maxDuration')?.hasError('required') && quizForm.get('maxDuration')?.touched"
                         class="error-message">
                         {{'QuizCreator.Timereq' | translate}}
                    </div>
                </div>
                <input id="maxDuration" type="text" formControlName="maxDuration" required>

                
                
                
                
                
                
                
                
                

                <div class="head">
                    <label for="passingThreshold">{{'QuizCreator.Min' | translate}}</label>
                    <div *ngIf="quizForm.get('passingThreshold')?.hasError('required') && quizForm.get('passingThreshold')?.touched"
                         class="error-message">
                         {{'QuizCreator.Minreq' | translate}}
                    </div>
                </div>
                <input id="passingThreshold" type="number" formControlName="passingThreshold" required>

                <div class="head">
                    <label for="quizDescription">{{'QuizCreator.Description' | translate}}</label>
                    <div *ngIf="quizForm.get('quizDescription')?.hasError('required') && quizForm.get('quizDescription')?.touched"
                         class="error-message">
                         {{'QuizCreator.Descriptionreq' | translate}}
                    </div>
                </div>
                <textarea id="quizDescription" formControlName="quizDescription" required></textarea>

                <div class="head">
                    <label for="quizTechnology">{{'QuizCreator.Tech' | translate}}</label>
                    <div *ngIf="quizForm.get('quizTechnology')?.hasError('required') && quizForm.get('quizTechnology')?.touched"
                         class="error-message">
                         {{'QuizCreator.Techreq' | translate}}
                    </div>
                </div>
                <input id="quizTechnology" type="text" formControlName="quizTechnology" required>

                <div class="head">
                    <label for="quizTechnologyType">{{'QuizCreator.TechType' | translate}}</label>
                    <div *ngIf="quizForm.get('quizTechnologyType')?.hasError('required') && quizForm.get('quizTechnologyType')?.touched"
                         class="error-message">
                         {{'QuizCreator.TechTypereq' | translate}}
                    </div>
                </div>
                <select id="quizTechnologyType" formControlName="quizTechnologyType" required>
                    <option *ngFor="let techType of technologyTypes" [value]="techType.id">{{ techType.name }}</option>
                </select>
                
                <div formArrayName="questions">
                    <div *ngFor="let question of questionsArray.controls; let i=index">
                        <div [formGroupName]="i" class="question-container">
                            <div class="headButton">
                                <button id="remove" type="button" (click)="removeQuestion(i)">{{'QuizCreator.Remove' | translate}}</button>
                            </div>
                            <div class="head">
                                <label class="questionNumber" for="questionContent">{{'QuizCreator.Question' | translate}}{{i + 1}}</label>
                                <div
                                        *ngIf="question.get('questionContent').hasError('required') && question.get('questionContent').touched"
                                        class="error-message">
                                        {{'QuizCreator.Questionreq' | translate}}
                                </div>
                            </div>
                            <textarea id="questionContent" formControlName="questionContent" required></textarea>

                            <div class="answers" formArrayName="correctAnswers">
                                <div class="answer"
                                     *ngFor="let correctAnswer of question.get('correctAnswers')['controls']; let j=index">
                                    <div [formGroupName]="j">
                                        <div class="headButton">
                                            <button id="remove" type="button"
                                                    (click)="removeCorrectAnswer(question, j)">
                                                    {{'QuizCreator.Removegood' | translate}}
                                            </button>
                                        </div>
                                        <div class="head">
                                            <label for="correctAnswer">{{'QuizCreator.Answer' | translate}}{{j + 1}}:</label>
                                            <div
                                                    *ngIf="correctAnswer.get('correctAnswer').hasError('required') && correctAnswer.get('correctAnswer').touched"
                                                    class="error-message">
                                                    {{'QuizCreator.Answerreq' | translate}}
                                            </div>
                                        </div>
                                        <input id="correctAnswer" type="text" formControlName="correctAnswer" required>
                                        <div class="head">
                                            <label for="correctAnswerScore">{{'QuizCreator.Points' | translate}}</label>
                                            <div
                                                    *ngIf="correctAnswer.get('correctAnswerScore').hasError('required') && correctAnswer.get('correctAnswerScore').touched"
                                                    class="error-message">
                                                    {{'QuizCreator.Pointsreq' | translate}}
                                            </div>
                                        </div>
                                        <input id="correctAnswerScore" type="number"
                                               formControlName="correctAnswerScore" required>
                                    </div>
                                </div>
                            </div>
                            <button id="add" type="button" (click)="addCorrectAnswer(question)">
                              {{'QuizCreator.Addgood' | translate}}
                            </button>

                            <div class="answers" formArrayName="falseAnswers">
                                <div class="answer"
                                     *ngFor="let falseAnswer of question.get('falseAnswers')['controls']; let k=index">
                                    <div [formGroupName]="k">
                                        <div class="headButton">
                                          <button id="remove" type="button" (click)="removeFalseAnswer(question, k)">
                                            {{'QuizCreator.Removebad' | translate}}
                                          </button>
                                        </div>
                                        <div class="head">
                                            <label for="falseAnswer">{{'QuizCreator.Badanswer' | translate}}{{k + 1}}</label>
                                            <div
                                                    *ngIf="falseAnswer.get('falseAnswer').hasError('required') && falseAnswer.get('falseAnswer').touched"
                                                    class="error-message">
                                                    {{'QuizCreator.Badanswerreq' | translate}}
                                            </div>
                                        </div>
                                        <div class="contentAnswer">
                                            <input id="falseAnswer" type="text" formControlName="falseAnswer" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button id="add" type="button" (click)="addFalseAnswer(question)">{{'QuizCreator.Addbad' | translate}}</button>
                        </div>
                    </div>
                    <button id="addq" type="button" (click)="addQuestion()" type="button">{{'QuizCreator.Add' | translate}}</button>
                </div>

                <button mat-button class="newJobbButton" type="submit">{{'QuizCreator.Save' | translate}}</button>
            </form>

        </div>
    </div>
</main>

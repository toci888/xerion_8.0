<div class="navbar">
    <a>{{'Quiz.Result' | translate}}{{quizAttempt && quizAttempt.quiz.name}}</a>
  </div>
  <div class="background" { quizAttempt && (>
      <div class="content">
          <div class="left">
            <!-- <app-donut-chart [userScore]="quizAttempt.quizAttempt.totalparticipantscore" [totalScore]="quizAttempt.quiz.totalscore!"></app-donut-chart> -->
            <app-donut-chart [userScore]="quizAttempt.quizAttempt.totalparticipantscore" [totalScore]="quizAttempt.quiz.totalscore!"></app-donut-chart>

          </div>
          <div class="right">
            <button [routerLink]="''" class="done">{{'Quiz.Leave' | translate}}</button>
              <div class="score">
                {{'Quiz.Result' | translate}}
                  <span [style.color]="examPassed ? '#00A993' : '#EB4335'">
                    {{ examPassed ? ('Quiz.Passed' | translate) : ('Quiz.Failed' | translate) }}
                </span>
              </div>
              <div class="time">
                {{'Quiz.Your time' | translate}}
                      <div class="timer">
                          {{quizAttempt && quizAttempt.quizAttempt.totalelapsedtime}} / {{quizAttempt && quizAttempt.quiz.totaltime}}
                      </div>


              </div>
              <div class="info">
                  <a>{{'Quiz.info1' | translate}} <b>{{quizAttempt.quizAttempt.totalparticipantscore}}</b>{{'Quiz.info2' | translate}}<b>{{quizAttempt.quiz.totalscore}}</b>
                    {{'Quiz.info3' | translate}}
                     <b>
                        {{ (quizAttempt.quiz.totalscore && (+quizAttempt.quizAttempt.totalparticipantscore / quizAttempt.quiz.totalscore) * 100)?.toFixed(2) }}%

                    </b></a>
              </div>
      </div>
  </div>
 )) }

import { Component, Input } from '@angular/core';
import { QuizAnswerDto, QuizDto, QuizQuestionDto, QuizzesAnswerDto, QuizzesQuestionDto } from 'src/app/shared/models/quizzes';
import { QuizMapper } from '../quiz-mapper';
import { QuizzesService } from '../quizzes.service';
import { Router } from '@angular/router';
import { TimerComponent } from '../timer/timer.component';
import { TimerService } from '../timer/timer.service';

@Component({
  selector: 'questions-x',
  templateUrl: './questions.component.html',
  styleUrls: ['./questions.component.scss']
})
export class QuestionsComponent {

  quizQuestions: QuizQuestionDto[] = [];
  quiz: QuizDto = {} as QuizDto;
  elapsedTime: string = '00:00';

  @Input() quizz: QuizDto = {} as QuizDto;

  answers: QuizAnswerDto[] = [];

  constructor(protected quizzesService: QuizzesService,
    private router: Router,
    private timerService: TimerService
    ) {
    
  }
  currentQuestionNumber: number = 0;
  currentQuestion: QuizzesQuestionDto | undefined = {} as QuizzesQuestionDto;

  totalQuestions!: number;

  ngOnInit() {
    this.quiz = this.quizz;
    this.currentQuestion = this.quiz.quizzesQuestions[this.currentQuestionNumber];
    this.totalQuestions = this.quiz.quizzesQuestions.length;
    this.quizQuestions = QuizMapper.mapToQuestionsWithAnswers(this.quiz);

    this.quizQuestions.forEach(question => {
      this.answers.push({ answers: [], question: question.question });
    });

    this.timerService.getElapsedTime().subscribe((elapsedTime) => {
      this.elapsedTime = elapsedTime;
    });
  }

  onSelecting(value: Event) {
    const target = value.target as HTMLInputElement | null;

    if (target) {
      const answer = Number(target.value)
      this.answers[this.currentQuestionNumber].answers = [];
      
      this.answers[this.currentQuestionNumber].answers.push({
        id: answer, 
        idquestion: this.currentQuestion?.id
      } as QuizzesAnswerDto)
    }
  }
  
  onPrev() {
    --this.currentQuestionNumber;
    this.currentQuestion = this.quiz.quizzesQuestions[this.currentQuestionNumber];
  }

  onNext(value: Event) {
    const countObjectsWithAnswers = this.answers.filter(item => item.answers.length > 0).length;

    if(this.answers[this.currentQuestionNumber].answers.length == 0) return;

    ++this.currentQuestionNumber;
    this.currentQuestion = this.quiz.quizzesQuestions[this.currentQuestionNumber];
  }

  submit() {
    this.quizzesService.sendQuizResults(this.answers, this.elapsedTime).subscribe(res => {
      this.router.navigate(['quiz/result/'+res.methodResult]);
    })
  }
}

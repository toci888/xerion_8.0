﻿using Intotech.Xerion.Bll.Models.ModelDtos.Quizzes.Dtos;
using Intotech.Xerion.Bll.Models.Quizzes;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Quizzes.Bll.Persistence.Interfaces.CompleteDto;

public class GetQuizDto
{
    public QuizModelDto Quiz { get; set; }
    public List<QuizzesAnswerDto> QuizzesAnswers { get; set; }
    public List<QuizzesQuestionDto> QuizzesQuestions { get; set; }
}
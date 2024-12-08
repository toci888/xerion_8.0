import {HomepageComponent} from './pages/homepage/homepage.component';
import {TranslateLoader, TranslateModule} from '@ngx-translate/core';
import {TranslateHttpLoader} from '@ngx-translate/http-loader';
import {NgModule} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';
import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {LandingPageComponent} from './pages/landingpage/landing-page.component';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {MatGridListModule} from "@angular/material/grid-list";
import {MatIconModule} from "@angular/material/icon";
import {MatSlideToggleModule} from "@angular/material/slide-toggle";
import {MatListModule} from "@angular/material/list";
import {MatCardModule} from "@angular/material/card";
import {MatButtonModule} from "@angular/material/button";
import {MatToolbarModule} from "@angular/material/toolbar";
import {RegisterPopUpComponent} from './pages/landingpage/register-pop-up/register-pop-up.component';
import {MatDialogModule} from "@angular/material/dialog";
import {MatRadioModule} from "@angular/material/radio";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {MatInputModule} from "@angular/material/input";
import {MatCheckboxModule} from "@angular/material/checkbox";
import {MatTooltipModule} from "@angular/material/tooltip";
import {MatSnackBarModule} from "@angular/material/snack-bar";
import { LoginPopUpComponent } from './pages/landingpage/login-pop-up/login-pop-up.component';
import { ToastrModule } from 'ngx-toastr';
import { HeaderComponent } from './components/header/header/header.component';
import { FooterComponent } from './components/footer/footer/footer.component';
import { UserPageComponent } from "./pages/userpage/user-page.component";
import {MatProgressBarModule} from "@angular/material/progress-bar";
import {HTTP_INTERCEPTORS, HttpClient, HttpClientModule} from '@angular/common/http';
import { JwtInterceptor} from "./shared/helpers/interceptors/basic-interceptor.interceptor";
import { CompanyPageComponent } from './pages/companypage/company-page.component';
import { EditUserProfileComponent } from './pages/edit-userpage/edit-user-profile/edit-user-profile/edit-user-profile.component';
import { MatSelectModule } from '@angular/material/select';
import { EditUserProfileGridComponent } from './pages/edit-userpage/edit-user-profile/edit-user-profile-grid/edit-user-profile-grid/edit-user-profile-grid.component';
import { MatDatepickerModule } from '@angular/material/datepicker';
import {DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE, MatNativeDateModule} from '@angular/material/core';
import { MatSliderModule } from '@angular/material/slider';
import { QuizSolveComponent } from './pages/quizes/quiz-solve/quiz-solve.component';
import { MultiChoiceQuestionComponent } from './pages/quizes/quiz-solve/multi-choice-question/multi-choice-question.component';
import { CompleteSentenceQuestionComponent } from './pages/quizes/quiz-solve/complete-sentence-question/complete-sentence-question.component';
import { EditCompanyPageComponent } from './pages/edit-companypage/edit-company-page.component';
import { NavigationMenuComponent } from './components/navigation-menu/navigation-menu/navigation-menu.component';
import {MatSidenavModule} from '@angular/material/sidenav';
import { MatMenuModule } from '@angular/material/menu';
import { RouterModule } from '@angular/router';
import { MatExpansionModule } from '@angular/material/expansion';
import { ListjoboffersComponent } from './pages/listjoboffers/listjoboffers.component';
import { AreYouSurePopUpComponent } from './components/are-you-sure-pop-up/are-you-sure-pop-up.component';
import {MatAutocompleteModule} from '@angular/material/autocomplete';
import { TextMaskModule } from 'angular2-text-mask';
import { CompaniesPageComponent } from './pages/companiespage/companies-page.component';
import { MatTableModule } from '@angular/material/table';
import { RegisterCompanyPopUpComponent } from './components/register-company-pop-up/register-company-pop-up.component';
import { SafePipe } from './pages/companypage/safe.pipe';
import {MomentUtcDateAdapter} from "./shared/services/MomentUtcDateAdapter";
import {MAT_MOMENT_DATE_FORMATS} from "@angular/material-moment-adapter";
import { SingleChoiceQuestionComponent } from './pages/quizes/quiz-solve/single-choice-question/single-choice-question.component';
import { QuizzesComponent } from './pages/quizzes/quizzes.component';
import { QuestionsComponent } from './pages/quizzes/questions/questions.component';
import { TimerComponent } from './pages/quizzes/timer/timer.component';
import { ResultComponent } from './pages/quizzes/result/result.component';
import { EditJobofferComponent } from './pages/edit-joboffer/edit-joboffer.component';
import { DonutChartComponent } from './pages/quizzes/DonutChartComponent ';
import { NgApexchartsModule } from "ng-apexcharts";
import { CapitalizePipe } from './shared/pipes/capitalize.pipe';
import { JobofferComponent } from './pages/joboffer/joboffer.component';
import { QuizCreateComponent } from './pages/quizes/quiz-create/quiz-create.component';
import { QuizzesListComponent } from './pages/quizzes-list-component/quizzes-list-component.component';
import { JobOfferAppliesComponent } from './pages/job-offer-applies/job-offer-applies.component';
import { TermsComponent } from './pages/terms/terms.component';
import { AboutComponent } from './pages/about/about.component';

@NgModule({
  exports: [
    MatSnackBarModule,
  ],
  declarations: [
    AppComponent,
    HomepageComponent,
    AppComponent,
    LandingPageComponent,
    RegisterPopUpComponent,
    LoginPopUpComponent,
    HeaderComponent,
    FooterComponent,
    UserPageComponent,
    CompanyPageComponent,
    EditUserProfileComponent,
    EditUserProfileGridComponent,
    QuizCreateComponent,
    QuizSolveComponent,
    MultiChoiceQuestionComponent,
    CompleteSentenceQuestionComponent,
    EditCompanyPageComponent,
    NavigationMenuComponent,
    ListjoboffersComponent,
    AreYouSurePopUpComponent,
    CompaniesPageComponent,
    RegisterCompanyPopUpComponent,
    SafePipe,
    SafePipe,
    SafePipe,
    SafePipe,
    EditJobofferComponent,
    SingleChoiceQuestionComponent,
    QuizzesComponent,
    QuestionsComponent,
    TimerComponent,
    ResultComponent,
    DonutChartComponent,
    CapitalizePipe,
    JobofferComponent,
    QuizzesListComponent,
    JobOfferAppliesComponent,
    TermsComponent,
    AboutComponent
  ],
  imports: [
    NgApexchartsModule,
    MatTableModule,
    MatGridListModule,
    MatIconModule,
    MatSlideToggleModule,
    MatListModule,
    MatCardModule,
    MatButtonModule,
    MatToolbarModule,
    MatDialogModule,
    MatRadioModule,
    MatSelectModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatSliderModule,
    MatAutocompleteModule,
    FormsModule,
    ReactiveFormsModule,
    MatInputModule,
    MatCheckboxModule,
    MatTooltipModule,
    TextMaskModule,
    HttpClientModule,
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      }
    }),
    ToastrModule.forRoot(),
    MatProgressBarModule,
    MatSidenavModule,
    MatMenuModule,
    RouterModule,
    MatExpansionModule,
  ],
  providers: [
    { provide: MAT_DATE_LOCALE, useValue: 'en-GB' },
    { provide: MAT_DATE_FORMATS, useValue: MAT_MOMENT_DATE_FORMATS },
    { provide: DateAdapter, useClass: MomentUtcDateAdapter },
    {provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true}, CompaniesPageComponent
  ],
  bootstrap: [AppComponent],
})
export class AppModule {
}

// required for AOT compilation
export function HttpLoaderFactory(http: HttpClient): TranslateHttpLoader {
  return new TranslateHttpLoader(http);
}

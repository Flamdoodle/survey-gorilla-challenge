get '/surveys' do
  @all_surveys = Survey.all
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :all_surveys
end

get '/survey/new' do
  erb :create_survey
end

post '/survey/new' do
  @current_survey = Survey.create(title: params[:title])
  user = User.find(session[:user_id])
  user.surveys << @current_survey
  redirect "/survey/#{@current_survey.id}/questions"
end

get '/survey/:survey_id/questions' do
  @current_survey = Survey.find_by_id(params[:survey_id])
  erb :question
end

post '/survey/:survey_id/questions/' do
  question = Question.create(survey_question: params[:question1])
  survey = Survey.find(params[:survey_id])
  survey.questions << question
  params.each do |k, v|
    if k[0..5] == "choice"
      choice = Choice.create(survey_choice: v)
      question.choices << choice
    end
  end
end

get '/survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  erb :survey
end

get '/survey/:survey_id/incomplete' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  erb :incomplete_survey
end

get '/survey/:survey_id/finish' do
  survey = Survey.find(params[:survey_id])
  survey.completed = true
  survey.save
  redirect "/users/#{session[:user_id]}"
end

post '/survey/:survey_id/submit' do
  survey = Survey.find(params[:survey_id])
  choices = params[:choices]
  choices.each_value do |v|
    choice = Choice.find(v.to_i)
    choice.tally += 1
    choice.save
  end
  redirect '/'
end

get '/survey/:survey_id/results' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  erb :survey_results
end

get '/surveys' do
# List all Surveys.  Link to form to create new Survey.
  @all_surveys = Survey.all
  erb :all_surveys
end

get '/survey/new' do
# Add title.
# Add Questions to Survey.
# Add Choices to Questions.
  erb :create_survey
end

post '/survey/new' do
  @current_survey = Survey.create(title: params[:title])
  # @new_survey.questions << Question.create(survey_question: params[:questions])

  redirect "/survey/#{@current_survey.id}/questions"
# Create new Survey in database.
# Create new Questions in database.
# Create new Choices in database.
# Redirect to profile page.
end

get '/survey/:survey_id/questions' do
  @current_survey = Survey.find_by_id(params[:survey_id])

  erb :questions
end


get '/survey/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :survey
end

post '/survey/:survey_id/submit' do
  survey = Survey.find(params[:survey_id])
  p params
  choices = params[:choices]
  choices.each_value do |v|
    choice = Choice.find(v.to_i)
    choice.tally += 1
    choice.save
  end
  redirect '/'
end

get '/survey/:id/results' do
# View results of Survey with id.
end

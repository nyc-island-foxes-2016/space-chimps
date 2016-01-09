get '/responses/new' do

  @survey = Survey.find_by(id: params[:survey_id])
  @surveys_user = SurveysUser.find_or_create_by(user_id: session[:user_id], survey_id: params[:survey_id])
  # binding.pry
  next_question_id_answer = @survey.next_question_id
  @question = Question.find_by(id: next_question_id_answer)
  erb :'responses/new'
end

post '/responses' do
  response = Response.create(option_id: params[:option], surveys_user_id: params[:surveys_user], question_id: params[:question_id])
  # surveys_user = SurveysUser.find_by(id: params[:surveys_user])
  # survey = Survey.find_by(id: surveys_user.survey_id)

  # # next_question_id = survey.next_question_id

  redirect "/responses/new"
end


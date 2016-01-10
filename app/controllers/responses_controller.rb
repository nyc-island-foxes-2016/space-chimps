get '/responses/new' do
  @surveys_user = SurveysUser.find_by(id: params[:surveys_user_id])
  @survey = Survey.find_by(id: @surveys_user.survey_id)
binding.pry
  @question = @surveys_user.next_question
  erb :'responses/new'
end

post '/responses' do
  response = Response.create(option_id: params[:option], surveys_user_id: params[:surveys_user_id], question_id: params[:question_id])

  redirect "/responses/new?surveys_user_id=#{response.surveys_user_id}"
end



get '/responses/new' do
  survey = Survey.find(1)
  user = User.find(2)
  @survey_user = SurveysUser.new(user_id: user.id, survey_id: survey.id)

  if @survey_user.save
    binding.pry
    @next_question = survey.next_question
    erb :'responses/new'
  else
    # @errors = @survey_user.errors.full_messages
    # erb :'responses/new'
  end
end

post '/responses' do
  response = Response.new(option_id: params[:option], surveys_user_id: params[:surveys_user])


end



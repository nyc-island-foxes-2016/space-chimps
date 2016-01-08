
get '/responses/new' do
  survey = Survey.find(1)
  user = User.find(2)
  @survey_user = SurveysUser.new(user_id: user.id, survey_id: survey.id)

  if @survey_user.save
    erb :'responses/new'
  else
    # @errors = @survey_user.errors.full_messages
    # erb :'responses/new'
  end
end


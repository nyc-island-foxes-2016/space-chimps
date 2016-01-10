get '/surveys' do
  user_and_other_surveys = Survey.created_and_not_created_by(current_user,Survey.all)

  @user_surveys = user_and_other_surveys[0]
  other_surveys = user_and_other_surveys[1]

  taken_and_not_taken_surveys = Survey.taken_and_not_taken_by(current_user, other_surveys)
  @surveys_taken = taken_and_not_taken_surveys[0]
  @surveys_not_taken = taken_and_not_taken_surveys[1]

  erb :'/surveys/index'
end

get '/surveys/new' do
  erb :"/surveys/new"
end

get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  @user = @survey.user
  erb :"/surveys/show"
end

post "/surveys" do
  @survey = Survey.new(params[:survey])
  @survey.user = current_user
  if @survey.save
    redirect "/surveys/#{@survey.id}"
  else
    @errors = @survey.errors.full_messages
    erb :"/surveys/edit"
  end
end

get '/surveys/:id/edit' do
  @survey = Survey.find_by(id: params[:id])
  erb :"/surveys/edit"
end

get '/surveys/:id/results' do
  @survey = Survey.find_by(id: params[:id])
  questions = @survey.questions
  @questions_results = []

  questions.each do |question|
    @questions_results << question.compiled_results
  end

  erb :"/surveys/results"
end

put '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  if @survey.update(params[:survey])
    redirect "/surveys/#{@survey.id}/edit"
  else
    @errors = @survey.errors.full_messages
    erb :"/surveys/edit"
  end
end

delete "/surveys/:id" do
  Survey.find_by(id: params[:id]).destroy
  redirect "/users/#{current_user.id}"
end

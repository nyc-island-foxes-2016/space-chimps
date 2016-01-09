get '/surveys' do
  @surveys = Survey.all
  @user_surveys = []
  @other_surveys = []
  @surveys.each do |survey|
      if survey.user == current_user
        @user_surveys << survey
      else
        @other_surveys << survey
      end
    end
  binding.pry
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

get '/surveys_users/:id' do
   @surveys_user = SurveysUser.find_by(id: params[:id])

   @survey = @surveys_user.survey
   erb :'/surveys_users/show'
end


post "/surveys_users" do
  # binding.pry
  surveys_user = SurveysUser.create(user_id: current_user.id, survey_id: params[:survey_id])
  redirect "/surveys_users/#{surveys_user.id}"
end


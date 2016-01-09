get '/questions/new' do
  binding.pry
  @survey = Survey.find_by(id: params[:survey_id])
  erb :"/questions/new"
end

# NEXT STEP: ADD Questions Post Route

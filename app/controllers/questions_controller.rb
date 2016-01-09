get '/questions/new' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :"/questions/new"
end

post '/questions' do
  binding.pry

end

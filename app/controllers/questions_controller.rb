get '/questions/new' do
  @survey = Survey.find_by(id: params[:survey_id])
  @error = params[:error]

  erb :"/questions/new"
end

post '/questions' do
  @question = Question.new(params[:question])

  if @question.save

    @options = []
    content_string = params[:options][:content_string]

    content_string.split(",").each do |option_content|
      option_content.strip!
      @options << Option.create(content: option_content, question: @question)
    end

    redirect "/questions/new?survey_id=#{@question.survey_id}"
  else
    redirect "/questions/new?survey_id=#{@survey.id}?error=Question did not save."
  end

end


get '/questions/:id' do
  # @survey = Survey.find_by(id: params[:survey_id])
  # @surveys_user = SurveysUser.find_or_create_by(user_id: session[:user_id], survey_id: params[:survey_id])
  # binding.pry
  # next_question_id = @survey.next_question_id
  # @question = Question.find_by(id: next_question_id)
  erb :"/questions/show"
end


delete '/questions/:id' do
  question = Question.find(params[:id])
  survey = Survey.find(question.survey_id)
  question.destroy
  redirect "/questions/new?survey_id=#{survey.id}"
end

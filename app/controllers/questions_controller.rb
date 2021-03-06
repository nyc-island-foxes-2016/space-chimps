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

    if request.xhr?
      erb :"/questions/_show", locals: {question: @question}, layout: false
    else
      redirect "/questions/new?survey_id=#{@question.survey_id}"
    end

  else
    redirect "/questions/new?survey_id=#{@survey.id}?error=Question did not save."
  end

end


delete '/questions/:id' do
  question = Question.find(params[:id])
  survey = Survey.find(question.survey_id)
  question.destroy
  if request.xhr?
    "Question deleted"
    erb :"/"
  else
    redirect "/questions/new?survey_id=#{survey.id}"
  end
end

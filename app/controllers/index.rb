get '/' do
  if logged_in?
    @surveys = Survey.all
    erb :'/surveys/index'
  else
    redirect :"/sessions/new"
  end
end

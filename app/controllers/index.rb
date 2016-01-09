get '/' do
  if logged_in?
    @surveys = Survey.all
    redirect :'/surveys'
  else
    redirect :"/sessions/new"
  end
end

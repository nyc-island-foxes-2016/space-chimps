get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  submitted_user = User.new(username: params[:username], password: params[:password])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/"
  else
    @user = User.new(username: params[:username])
    @errors = ["Invalid username or password."]
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session.clear
  redirect '/'
end

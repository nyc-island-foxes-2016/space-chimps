get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(username: params[:username])
  @user.password = params[:password]
  if @user.save
    redirect '/'
  else
    @errors = ["Invalid username or password."]
    erb :'/users/new'
  end
end

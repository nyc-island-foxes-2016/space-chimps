get '/users' do
  @users = User.all
  erb :'/users/index'
end

get '/users/new' do
  erb :'/users/new'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @things = @user.things
  erb :"/users/show"
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
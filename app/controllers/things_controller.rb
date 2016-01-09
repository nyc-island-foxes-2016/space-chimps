get '/things' do
  @things = Thing.all
  erb :"/things/index"
end

get '/things/new' do
  erb :"/things/new"
end

get '/things/:id' do
  @thing = Thing.find_by(id: params[:id])
  @user = @thing.user
  erb :"/things/show"
end

post "/things" do
  @thing = Thing.new(params[:thing])
  @thing.user = current_user
  if @thing.save
    redirect "/things/#{@thing.id}"
  else
    @errors = @thing.errors.full_messages
    erb :"/things/edit"
  end
end

get '/things/:id/edit' do
  @thing = Thing.find_by(id: params[:id])
  erb :"/things/edit"
end

put '/things/:id' do
  @thing = Thing.find_by(id: params[:id])
  if @thing.update(params[:thing])
    redirect "/things/#{@thing.id}"
  else
    @errors = @thing.errors.full_messages
    erb :"/things/edit"
  end
end

delete "/things/:id" do
  Thing.find_by(id: params[:id]).destroy
  redirect "/users/#{current_user.id}"
end

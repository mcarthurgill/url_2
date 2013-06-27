enable :sessions

get '/' do
  erb :index
end

post '/urls' do
  path = params[:original_url]
  @url = Url.new(:original => path)
  if @url.save
    @shortened = SecureRandom.hex(3)

    current_user ? user_id = current_user.id : user_id = nil
    @url.update_attributes(:shortened => @shortened, :user_id => user_id)
    erb :_shortened
  else 
    erb :_error
  end 
end

get '/:short_url' do
 intermediate = Url.find_by_shortened(params[:short_url])
 redirect intermediate.original
end

get '/users/new' do 
  erb :signup
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile
end

post '/users' do 
  p params
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
    # erb :profile
  else
    erb :_error
  end
end

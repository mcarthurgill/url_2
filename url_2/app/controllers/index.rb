get '/' do
  erb :index
end

post '/urls' do
  path = params[:original_url]
  @url = Url.new(:original => path)
  if @url.save
    @shortened = SecureRandom.hex(3)
    @url.update_attributes(:shortened => @shortened)
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
  @user = User.new
  erb :signup
end

post '/users' do 
  @user = User.new(params[:name])
  p @user
  erb :_error
end

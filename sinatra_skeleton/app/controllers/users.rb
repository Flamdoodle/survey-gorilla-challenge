get '/' do
  if session[:user_id]
    redirect "/users/#{session[:user_id]}"
  else
    erb :index
  end
end

post '/login' do
  @username = params[:username]
  user = User.authenticate(@username, params[:password])
  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @error = "invalid username or password."
    erb :index
  end
end

post '/signup' do
  user = User.new(username: params[:username])
  user.password = params[:password]
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @surveys = @user.surveys
  erb :profile
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/' do
  # session.destroy
  if session[:user_id]
    redirect "/users/#{session[:user_id]}"
  else
    redirect '/surveys'
  end
end

post '/login' do
  @username = params[:username]
  user = User.find_by_username(@username).authenticate(params[:password])
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
  user.password_confirmation = params[:confirmed_password]
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @completed_surveys = @user.surveys.where(completed: true)
  @incomplete_surveys = @user.surveys.where(completed: false)
  erb :profile
end

get '/logout' do
  session.clear
  redirect '/'
end


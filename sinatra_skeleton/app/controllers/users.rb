get '/' do
# Login and Sign up UNLESS loggedin
# Redirect to profile page IF loggedin
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

# Create new user in database. Validate if exists.
# Redirect to profile page.
end

get '/users/:id' do
## Profile page shows User's Surveys
## and link to Survey create screen.
  @user = User.find(params[:id])
  erb :profile
end

get '/logout' do
  session.clear
  redirect '/'
end

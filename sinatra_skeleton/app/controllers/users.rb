get '/' do
# Login and Sign up UNLESS loggedin
# Redirect to profile page IF loggedin
  erb :index
end

post '/login' do
# Validate user info.
# Redirect to profile page.
end

post '/signup' do
  user = User.new(username: params[:username])
  user.password = params[:password]
  user.save
  redirect '/users/user.id'
# Create new user in database. Validate if exists.
# Redirect to profile page.
end

get '/users/:id' do
## Profile page shows User's Surveys
## and link to Survey create screen.
end

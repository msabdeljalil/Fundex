get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sessions/new' do

  erb :'users/log_in'
end

post '/sessions/new' do
  # if loop bcrypt authentication
  redirect '/rounds'
  # else
  # redirect '/sessions/new'
end

get '/users/new' do

  erb :'users/sign_up'
end

post '/users/new' do
  User.create(user)
  redirect '/sessions/new'
end




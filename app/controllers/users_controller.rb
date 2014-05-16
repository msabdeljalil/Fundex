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
  User.create(params[:user])
  redirect '/sessions/new'
end

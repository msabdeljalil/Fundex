get '/sessions/new' do
  erb :'users/log_in'
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = "Hmm, it seems either your username or password were incorrect...try again?"
    erb :"users/log_in"
  end
end

get '/users/new' do
  # Is there a way to get the 'login / sign up' buttons to disapear when we go here?
  if session[:user_id]
    redirect '/rounds'
  else
    erb :'users/sign_up'
  end
end

post '/users' do
  @user = User.create(params[:user])
  if @user.valid?
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = @user.errors.full_messages
    erb :'users/sign_up'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end

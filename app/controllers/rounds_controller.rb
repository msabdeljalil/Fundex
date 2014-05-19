get '/rounds' do
  @user = User.find(session[:user_id])
  @rounds = @user.rounds
  erb :"users/view_previous_rounds"
end

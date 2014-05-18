get '/rounds' do
  "Well, rounds are a little difficult to write now.."
  @user = User.find(session[:user_id])
  @rounds = @user.rounds
  erb :"users/view_previous_rounds"
end

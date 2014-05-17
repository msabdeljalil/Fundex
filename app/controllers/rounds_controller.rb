get '/rounds' do
  "Well, rounds are a little difficult to write now.."
  @user = User.find(session[:user_id])
  @rounds = @user.rounds

  erb :"users/view_previous_rounds"
end

# get '/rounds/:round_id' do
#   erb :"users/result"
# end



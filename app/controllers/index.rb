get '/' do
  erb :index
end

get '/sign_in' do
  redirect request_token.authorize_url
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/auth' do
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  @user = User.find_or_initialize_by_username(@access_token.params[:screen_name])

  @user.update_attributes(:oauth_token => @access_token.token,
                          :oauth_secret => @access_token.secret)

  session.delete(:request_token)
  session[:user_id] =  @user.id
  erb :index
end

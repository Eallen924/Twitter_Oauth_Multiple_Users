get '/tweet' do
	current_user.fetch_tweets!
  if current_user.tweets.empty?
    @error = "Either this user does not exist or they do not have any tweets."
  end

  @tweets = current_user.tweets.order("twitter_id DESC").limit(10)
  erb :profile
end

post '/tweet' do
	user = current_user
 	user.twitter_client.update(params[:tweet][:text])
  redirect "/tweet"
end
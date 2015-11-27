enable :sessions

get '/users' do
  body = {
    code: params[:code],
    client_id: '540766119586-iojakvterd170kjithnlgr05o9mnlvuc.apps.googleusercontent.com',
    client_secret: ENV['CLIENT_SECRET'],
    redirect_uri: 'http://localhost:9393/users',
    grant_type: 'authorization_code'
  }
  post_response = HTTParty.post("https://accounts.google.com/o/oauth2/token", body: body)
  get_response =  HTTParty.get("https://www.googleapis.com/plus/v1/people/me?access_token=#{post_response['access_token']}")

  email = get_response["emails"][0]["value"]
  name = get_response["displayName"]

  p @user = User.new(name: name, email: email)
  if @user && @user.save
    session[:id] = @user.id
    redirect '/'
  else
    flash[:errors] = "Login failed! Please try again"
    redirect '/'
  end
end

post '/users' do

end

get '/users/new' do
  redirect 'https://accounts.google.com/o/oauth2/auth?scope=email%20profile&state=%2Fprofile&redirect_uri=http://localhost:9393/users&response_type=code&client_id=540766119586-iojakvterd170kjithnlgr05o9mnlvuc.apps.googleusercontent.com'
end

get '/users/:id' do

end

get '/users/:id/edit' do

end

put '/users/:id' do

end

delete '/users/:id' do

end

# get '/oauth2callback' do

# end

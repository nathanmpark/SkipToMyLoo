enable :sessions

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect "/contacts"
  else
    flash[:error] = "Wrong Password or Username"
    redirect '/'
  end
end

delete '/sessions/:id' do
 session[:id] = nil
 redirect '/'
end

####### Just for testing ######
get '/session' do
  session.inspect
end

get '/sessions/new' do
  redirect 'https://accounts.google.com/o/oauth2/auth?scope=email%20profile&state=%2Fprofile&redirect_uri=http://localhost:9393/sessions&response_type=code&client_id=1020476674313-2hik76v7r8ue5mkkkhasth0drueq30p7.apps.googleusercontent.com'
end

get '/sessions' do
  body = {
    code: params[:code],
    client_id: '1020476674313-2hik76v7r8ue5mkkkhasth0drueq30p7.apps.googleusercontent.com',
    client_secret: ENV['CLIENT_SECRET'],
    redirect_uri: 'http://localhost:9393/sessions',
    grant_type: 'authorization_code'
  }
  post_response = HTTParty.post("https://accounts.google.com/o/oauth2/token", body: body)
  get_response =  HTTParty.get("https://www.googleapis.com/plus/v1/people/me?access_token=#{post_response['access_token']}")

  email = get_response["emails"][0]["value"]
  name = get_response["displayName"]

  @user = User.find_by_email(email)

  if @user
    session[:id] = @user.id
    redirect '/'
  else
    flash[:errors] = "Login failed! Please try again"
    redirect '/'
  end
end

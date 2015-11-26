get '/' do
  erb :'sessions/new'
end

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

get '/google' do
  redirect 'https://accounts.google.com/o/oauth2/auth?scope=email%20profile&state=%2Fprofile&redirect_uri=http://localhost:9393/oauth2callback&response_type=code&client_id=540766119586-iojakvterd170kjithnlgr05o9mnlvuc.apps.googleusercontent.com'
end

get '/oauth2callback' do
    p ENV['CLIENT_SECRET']
  body = {
    code: params[:code],
    client_id: '540766119586-iojakvterd170kjithnlgr05o9mnlvuc.apps.googleusercontent.com',
    client_secret: ENV['CLIENT_SECRET'],
    redirect_uri: 'http://localhost:9393/oauth2callback',
    grant_type: 'authorization_code'
  }
  p body
  post_response = HTTParty.post("https://accounts.google.com/o/oauth2/token", body: body)
  p post_response
  get_response =  HTTParty.get("https://www.googleapis.com/plus/v1/people/me?access_token=#{post_response['access_token']}")
  p get_response
  "Hello World"
end

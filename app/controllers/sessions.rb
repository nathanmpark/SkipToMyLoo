get '/' do
  erb :'sessions/video'
end

get '/google' do
  redirect 'https://accounts.google.com/o/oauth2/auth?scope=email%20profile&state=%2Fprofile&redirect_uri=http://localhost:9393/oauth2callback&response_type=code&client_id=540766119586-iojakvterd170kjithnlgr05o9mnlvuc.apps.googleusercontent.com'
end

get '/oauth2callback' do
  body = {
    code: params[:code],
    client_id: '540766119586-iojakvterd170kjithnlgr05o9mnlvuc.apps.googleusercontent.com',
    client_secret: 'client_secret',
    redirect_uri: 'http://localhost:9393/oauth2callback',
    grant_type: 'authorization_code'
  }
  post_response = HTTParty.post("https://accounts.google.com/o/oauth2/token", body: body)
  p post_response
"Hello World"
end
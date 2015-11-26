get '/' do
  erb :'sessions/login'
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

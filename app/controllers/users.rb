enable :sessions

#display a list of all users
get '/users' do
  erb :"/users/index"

  body = {
    code: params[:code],
    client_id: '450453162682-va3n53m2ns8ouifgkap1om2jqvhdnapo.apps.googleusercontent.com',
    client_secret: ENV['CLIENT_SECRET'],
    redirect_uri: 'https://skiptomyloo.herokuapp.com/users',
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

#return an erb with form for creating a new photo
get '/users/new' do

  redirect 'https://accounts.google.com/o/oauth2/auth?scope=email%20profile&state=%2Fprofile&redirect_uri=https://skiptomyloo.herokuapp.com/users&response_type=code&client_id=450453162682-va3n53m2ns8ouifgkap1om2jqvhdnapo.apps.googleusercontent.com'

end

#create a new user
post '/users' do
end

#display a specific user
get '/users/:id' do
end

#edit form for updating user account information
get '/users/:id/edit' do
end

#update a specific user
put '/users/:id' do
end

#delete user account
delete  '/users/:id' do
end







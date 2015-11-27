#display a list of all users
get '/users' do
  erb :"/users/index"
end

#return an erb with form for creating a new photo
get '/users/new' do
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
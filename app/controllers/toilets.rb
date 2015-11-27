#show all toilets
get '/toilets' do
  @toilets = Toilet.all
  # p "*" * 90
  # p @toilets
  # p "*" * 90
  @geojson = Array.new
  p @toilets.first.latitude
  @toilets.each do |toilet|


    @geojson << {
      "type"=> 'Feature',
      "geometry"=> {
        "type"=> 'Point',
        "coordinates"=> [toilet.latitude, toilet.longitude]
        },
        "properties"=> {
          "name"=> toilet.location,
          'marker-color'=> '#00607d',
          'marker-symbol'=> 'toilets',
          'marker-size'=> 'large'
        }
    }
  end
  # @geojson
  erb :"toilets/index"
end

#new toilet form
get '/toilets/new' do
  erb :"/toilets/new"
end

#create new toilet
post '/toilets' do
  toilet = Toilet.new
  if toilet.save
    redirect '/'
  else
    status 400
    flash[:errors] = toilet.errors.full_messages
    redirect "/toilets/new"
  end
end

#get edit page
get '/toilets/:id/edit' do
  @toilet = Toilet.find(params[:id])
  erb :"/toilets/edit"
end

#show a toilet
get '/toilets/:id' do
  @toilet = Toilet.find(params[:id])
  erb :"/toilets/show"
end

#submit toilet edit
put '/toilets/:id' do
  toilet = Toilet.find(params[:id])
  toilet.toiletname = params[:toiletname]
  toilet.email = params[:email]
  if toilet.save
    redirect '/'
  else
    flash[:errors] = toilet.errors.full_messages
    redirect "/toilets/#{toilet.id}/edit"
  end
end

#delete toilet
delete '/toilets/:id' do
  toilet.find(params[:id]).destroy
  redirect "/toilets/index"
end

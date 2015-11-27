post '/ratings' do
  p "*" *90
  p params
  p "*" *90

 rating = Rating.new(stars: params[:stars], review: params[:review], user_id: current_user.id, toilet_id: params[:toilet])
  if request.xhr?
    rating.save
    erb :'_append_review_partial', layout: false
  # if @rating && @rating.save
  #   flash[:errors] = "Review has been added!"
  #   redirect "/toilets/#{params[:toilet]}"
  else
    flash[:errors] = "Review couldn't be added! Please try again"
    redirect "/toilets/#{params[:toilet]}"
  end

end

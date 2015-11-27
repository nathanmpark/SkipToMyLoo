post '/ratings' do
  p params

 @rating = Rating.new(stars: params[:stars], review: params[:review], user_id: current_user.id, toilet_id: params[:toilet])

  if @rating && @rating.save
    flash[:errors] = "Review has been added!"
    redirect "/toilets/#{params[:toilet]}"
  else
    flash[:errors] = "Review couldn't be added! Please try again"
    redirect "/toilets/#{params[:toilet]}"
  end

end

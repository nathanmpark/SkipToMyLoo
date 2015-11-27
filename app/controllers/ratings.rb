post '/ratings' do

 rating = Rating.new(stars: params[:stars], review: params[:review], user_id: current_user.id, toilet_id: params[:toilet])

  if request.xhr?
    rating.save
    erb :'_append_review_partial', layout: false, locals: {rating: rating}
  else
    flash[:errors] = "Review couldn't be added! Please try again"
    redirect "/toilets/#{params[:toilet]}"
  end

end

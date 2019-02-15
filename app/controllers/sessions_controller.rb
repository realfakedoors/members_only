class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      render 'posts/new'
  	else
  		flash[:warning] = "Invalid login."
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
class WelcomeController < ApplicationController
  def index
  	if signed_in?
  		redirect_to "/products"
  	else
  		render "index"
	end
  end
end

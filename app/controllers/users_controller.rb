class UsersController < ApplicationController

	def splash
		@user = User.new   
		render :splash

	end

	def create
    @user = User.new(params[:user])
    
   	@user.save
    redirect_to suggestions_path(@suggestion)
  end
end
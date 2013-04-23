class UsersController < ApplicationController

	

	def new
		@user = User.new   
		render :new
	end

	def splash

	end

	def login
		user = User.where("email = ?", params[:email]).first
		session[:user_id] = user.user_id
		redirect_to suggestions_path
	end

	def index
		@users = User.all
	end

	def create
    @user = User.new(params[:user])
    
   	@user.save
   	session[:user_id] = @user.id
    redirect_to suggestions_path(@suggestion)
  end

  def show
  	@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
    @user.update_attributes(params[:user])
    render 'show'

	end
end
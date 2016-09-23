class RepositoriesController < ApplicationController

	before_action :authenticate_user!
	before_filter :check_permission 

	def index
		@repositories = Repository.all
	end

	def new 
		@repository =  Repository.new
	end

	def create
		@repository =  Repository.new(repository_params)
		@repository.access_level = params[:access_level]

		if @repository.save
      flash[:notice] = "You have successfully created project"
      redirect_to repositories_path
    else
      render :new
    end


	end


	private

  def repository_params
    params.require(:repository).permit(:name, :access_level, :description)
  end

  def check_permission
  	if current_user.subdomain != request.subdomain
  		flash[:notice] = "Please login to your subdomain #{current_user.subdomain}.lvh.me"
  		sign_out current_user
		  redirect_to root_url
		end
  end



	
end

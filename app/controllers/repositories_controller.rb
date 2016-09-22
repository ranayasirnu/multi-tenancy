class RepositoriesController < ApplicationController


	def index
		@repositories = Repository.all
	end

	def new 
		@repository =  Repository.new
	end

	def create
		@repository =  current_user.repositories.new(repository_params)
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





	
end

class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def new
    @profile = Profile.new
  end

  def create
    @profile_params = params.require(:profile)
                            .permit(:name, :sector, :region, :company)
    @profile = Profile.create(@profile_params)
    @profile.email = current_user.email
    @profile.user = current_user
    @profile.save
    redirect_to root_path
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile_params = params.require(:profile)
                            .permit(:name, :sector, :region, :company)
    @profile = Profile.find_by(id: params[:id])
    if @profile.update(@profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end
  
  def show
    @profile = Profile.find_by(id: params[:id])
  end

end
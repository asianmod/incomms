class HomeController < ApplicationController
  before_action :authenticate_user!

  def index    
    if Profile.exists?(email: current_user.email)
      @profile = Profile.find_by(email: current_user.email)
      if @profile.email.blank? || @profile.sector.blank?  
        @profile.company.blank? || @profile.region.blank?
        flash[:notice] = 'Por favor finalize seu perfil para utilizar o sistema'
        redirect_to edit_profile_path(@profile)     
      end
    else
      redirect_to new_profile_path
    end
  end
end
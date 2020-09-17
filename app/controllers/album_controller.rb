class AlbumController < ApplicationController
  before_action :authenticate_user!
  def album_params
    params.require(:album).permit(:product_id, images[]) 
  end
end
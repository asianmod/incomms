class AlbumController < ApplicationController

  def album_params
    params.require(:album).permit(:product_id, images[]) 
  end
end
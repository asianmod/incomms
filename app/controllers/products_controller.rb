class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def index #find =/= find_by procurar dif
    @profile = Profile.find_by(email: current_user.email)
    @all_profiles_logged = Profile.where("company like ?", @profile.company)
    @products = Product.where(profile: @all_profiles_logged).where.not(status: 5)
  end

  def search
    @product = Product.find_by(token: params[:q])
    render :show   
  end

  def show
    @product = Product.find(params[:id])  
  end

  def create
    @product_params = params.require(:product)
                            .permit(:name, :item_desc, :price)
    @product = Product.create(@product_params)
    @product.profile_id = Profile.find_by(email: current_user.email).id
    @product.save
    @product.stand_by!    
    redirect_to product_path(id: @product.id)
  end

  def comment
    @comment_params = params.require(:comment).permit(:replay, :product_id)
    @comment = Comment.create(@comment_params)
    @comment.profile_id = Profile.find_by(email: current_user.email).id
    @comment.save
    #@comment.profile  = Profile.find_by(email: current_user.email)
    redirect_to product_path(id: @comment.product_id)
  end
end
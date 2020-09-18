class TradingLogsController < ApplicationController
  before_action :authenticate_user!
  def buying
    @trading_log = TradingLog.new
    @product = Product.find_by(id: params[:product_id])
    @product.buying!
    @trading_log.seller_id = @product.profile_id
    @trading_log.profile_id = Profile.find_by(email: current_user.email).id
    @trading_log.product_id = Product.find_by(id: params[:product_id]).id
    @trading_log.save!
    redirect_to trading_log_path(@trading_log) 
  end

  def index
    @profile_id = Profile.find_by(email: current_user.email)
    @trading_logs = TradingLog.where(seller_id: @profile_id).where.not(status: 50)
  end

  def show
    @trading_log = TradingLog.find(params[:id])
  end

  def comment
    @log_comment_params = params.require(:log_comment).permit(:private_message, :trading_log_id)
    @log_comment = LogComment.create(@log_comment_params)
    @log_comment.profile_id = Profile.find_by(email: current_user.email).id
    @log_comment.save
    redirect_to trading_log_path(id: @log_comment.trading_log_id)
  end

  def cancel
    @trading_log_params = params.require(:trading_log).permit(:trading_log_id)
    @trading_log = TradingLog.find_by(id: @trading_log_params[:trading_log_id])
    @trading_log.canceled!
    @product = Product.find_by(id: @trading_log)
    @product.stand_by!
    redirect_to trading_logs_path
  end

  def confirm
    @trading_log_params = params.require(:trading_log).permit(:trading_log_id)
    @trading_log = TradingLog.find_by(id: @trading_log_params[:trading_log_id])
    @trading_log.confirmed!
    redirect_to trading_logs_path
  end
end


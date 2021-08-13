class UserStocksController < ApplicationController
  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    stock.users << current_user
    flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
    redirect_to portfolio_index_path
  end
end

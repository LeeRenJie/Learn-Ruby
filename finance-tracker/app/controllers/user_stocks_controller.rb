class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by(ticker: (params[:ticker]))
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    if stock.save
      stock.users << current_user
      flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
    else
      flash[:notice] = "Stock #{params[:ticker]} could not be added to your portfolio"
    end
    redirect_to portfolio_index_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    user_stock.destroy
    flash[:notice] = "Stock #{stock.ticker} was successfully removed from your portfolio"
    redirect_to portfolio_index_path
  end
end

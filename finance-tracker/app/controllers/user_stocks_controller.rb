class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by(ticker: (params[:ticker]))
    if stock.blank? || !current_user.stocks.exists?(params[:ticker])
      stock = Stock.new_lookup(params[:ticker])
      if stock.save
        stock.users << current_user
        flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
      else
        flash[:notice] = "Stock #{params[:ticker]} could not be added to your portfolio"
      end
    end
    redirect_to portfolio_index_path
  end

  def destroy
    stock =  current_user.user_stocks.find(params[:id])
    stock.destroy
    flash[:notice] = "Stock #{Stock.find(params[:id]).ticker} was successfully removed from your portfolio"
    redirect_to portfolio_index_path
  end
end


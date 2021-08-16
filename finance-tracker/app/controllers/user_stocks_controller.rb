class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by(ticker: (params[:ticker]))
    if stock.blank? || !current_user.stocks.exists?(stock.id)
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
end

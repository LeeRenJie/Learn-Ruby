class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by(ticker: (params[:ticker]))
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    begin
      stock.users << current_user
      flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
    rescue
      flash[:notice] = "Stock #{params[:ticker]} could not be added to your portfolio"
    end
    redirect_to portfolio_index_path
  end
end

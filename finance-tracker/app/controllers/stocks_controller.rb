class StocksController < ApplicationController
  def index
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render 'portfolio/index.html.erb'
      else
        flash[:alert] = "Sorry, we couldn't find that stock. Please try again."
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a stock symbol"
      redirect_to my_portfolio_path
    end
  end
end

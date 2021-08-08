class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'portfolio/result' }
        end
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

class StocksController < ApplicationController
  def index
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'portfolio/result' }
        end
      else
        flash[:alert] = "Sorry, we couldn't find that stock. Please try again."
        redirect_to portfolio_index_path
      end
    else
      flash[:alert] = "Please enter a stock symbol"
      redirect_to portfolio_index_path
    end
  end
end

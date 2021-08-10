class PortfolioController < ApplicationController
  def index
    @tracked_stocks = current_user.stocks
  end
end

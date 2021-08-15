class PortfolioController < ApplicationController
  def index
    @tracked_stocks = current_user.stocks
    @user = current_user
  end
end

class PortfolioController < ApplicationController
  def index
  end

  def show
    @pic = 'screenshots/' + params[:id] + '.' + params[:format]
  end
end

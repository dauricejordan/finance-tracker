class StocksController < ApplicationController
  
  def search
    @stock = Stock.new_from_lookup(params[:stock])
    #flash.now[:danger] = "Invalid Stock Entered \"" + params[:stock] + "\"" unless @stock
    flash.now[:danger] = "Invalid Stock Entered \" #{params[:stock]}\"" unless @stock
    render partial: 'users/result'
  end
  
end
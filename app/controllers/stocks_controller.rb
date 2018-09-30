class StocksController < ApplicationController
  
  def search
    @stock = Stock.new_from_lookup(params[:stock])
    flash.now[:danger] = "Invalid Stock Entered \"" + params[:stock] + "\"" unless @stock
    #if !@stock
    #  flash.now[:danger] = "Invalid Stock Entered \"" + params[:stock] + "\"" 
    #end
    render partial: 'users/result'
  end
  
end
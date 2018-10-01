class StocksController < ApplicationController
  
  #def search
  # @stock = Stock.new_from_lookup(params[:stock])
  #  #flash.now[:danger] = "Invalid Stock Entered \"" + params[:stock] + "\"" unless @stock
  #  flash.now[:danger] = "Invalid Stock Entered \" #{params[:stock]}\"" unless @stock
  #  render partial: 'users/result'
  #end
  
  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
    end
    render partial: 'users/result'
  end
end
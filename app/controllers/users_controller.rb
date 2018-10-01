class UsersController < ApplicationController
  
    def my_portfolio
      @user = current_user
      @user_stocks = current_user.stocks
    end
  
    def my_friends
      @friendships = current_user.friends
    end
  
    def search
      #@users = User.search(params[:search_param])
      #flash.now[:danger] = "Invalid Stock Entered \"" + params[:stock] + "\"" unless @stock
      #flash.now[:danger] = "No users match this search criteria \"#{params[:search_param]}\"" if @users.blank?
      #render partial: 'friends/result'
      if params[:search_param].blank?
        flash.now[:danger] = "You have entered an empty search string"
      else
        @users = User.search(params[:search_param])
        @users = current_user.except_current_user(@users)
        #puts @users
        flash.now[:danger] = "No users match this search criteria" if @users.blank?
      end
      render partial: 'friends/result'
      #@users = User.search(params[:search_param])
      #render json: @users
      
    end
  
    def add_friend
      @friend = User.find(params[:friend])
      current_user.friendships.build(friend_id: @friend.id)
      
      if current_user.save
        flash[:success] = "Friend was successfully added"
      else
        flash[:danger] = "There was something wrong with the friend request"
      end
      redirect_to my_friends_path 
    end
  
  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end

end
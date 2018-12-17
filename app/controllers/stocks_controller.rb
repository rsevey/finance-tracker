class StocksController < ApplicationController
    def search
      p '---------------------------------'
      puts 'inside search'
      p params[:stock]
      if params[:stock].present?
        puts 'params present'
        @stock = Stock.new_from_lookup(params[:stock])
        puts @stock
        if @stock
          respond_to do |format|
            format.js {render partial: 'users/result'}
          end
        else
          flash[:danger] = "You have entered an incorrect symbol"
          redirect_to my_portfolio_path
        end
      else
        flash[:danger] = "You have entered an empty search string"
        redirect_to my_portfolio_path
      end
    end
  end
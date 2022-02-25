class SearchesController < ApplicationController



  def search
    @range = params[:range]
    if @range == 'User'
      @users = User.looks(params[:search], params[:keyword])
    else
      @books = Book.looks(params[:search], params[:keyword])
    end
    

  end
  


end

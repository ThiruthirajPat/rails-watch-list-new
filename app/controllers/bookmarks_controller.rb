class BookmarksController < ApplicationController

    before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
    before_action :set_list, only: [:new, :create]
            
    def index
      @bookmarks = Bookmark.all
    end
            
    def show
    end
            
    def new
      @bookmark = Bookmark.new
    end
            
    def edit
    end
          
    def update
    end
            
    def destroy
      @bookmark.destroy
      redirect_to lists_path
    end
            
    def create
      @bookmark = Bookmark.new(bookmark_params)
      @bookmark.list = @list
        if @bookmark.save
          redirect_to list_path(@list), notice: 'Bookmark was created' 
        else
          render :new
        end
    end
            
    private
    
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end
            
    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end

    def set_list
      @list = List.find(params[:list_id])
    end
  
end

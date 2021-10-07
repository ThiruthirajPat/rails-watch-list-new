class ReviewsController < ApplicationController
    before_action :set_list, only: [:new, :create]
    before_action :set_review, only: [:destroy]

    def new
      @review = Review.new
    end

    def create
      @review = Review.new(review_params)
      @review.list = @list
        if @review.save
          redirect_to list_path(@list), notice: 'Comment was created' 
        else
          render :new
        end
    end

    def destroy
        @review.destroy
        redirect_to lists_path, notice: 'Comment was deleted' 
    end

    private
    
    def review_params
      params.require(:review).permit(:content, :list_id)
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    def set_review
      @review = Review.find(params[:id])
    end
  
end

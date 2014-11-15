class CommentsController < ApplicationController

  before_action :set_picture
  before_action :set_comment, only: [:destroy]

  def index
    @comments = Comment.where_picture_id(@picture.id).to_a
  end

  def create
    @comment = @picture.comments.create(comment_params)
  end

  def destroy
    @comment.destroy
  end

  private

    def set_picture
      @picture = Picture.get(params[:picture_id])
    end

    def set_comment
      @comment = @picture.comments.get(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
end

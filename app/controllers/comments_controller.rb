class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: [:show, :edit, :update, :destroy, :city, :title, :description]

  def create
    @spot = Spot.find(params[:spot_id])
    @comment = @spot.comments.new(params[:comment].permit(:body))
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @spot, notice: 'Comment was successfully created.'}
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @spot = Spot.find(params[:spot_id])
    @comment = @spot.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @spot, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
      @comment = Comment.find(params[:user_id])
      redirect_to root_url, notice: 'Access Denied!' unless current_user.id == @comment.user.id
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end

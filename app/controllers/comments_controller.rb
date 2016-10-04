class CommentsController < ApplicationController

  def create
    @spot = Spot.find(params[:spot_id])
    @comment = @spot.comments.create!(params[:comment].permit(:body))

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

  def comment_params
    params.require(:comment).permit(:body)
  end

end

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: "Comment was successfully added."
    else
      redirect_to @post, alert: "Error adding comment: #{@comment.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      redirect_to @post, notice: "Comment was successfully deleted."
    else
      redirect_to @post, alert: "You can only delete your own comments."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

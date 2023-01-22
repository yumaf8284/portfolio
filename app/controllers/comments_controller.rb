class CommentsController < ApplicationController
    def new
        @comment = Comment.new
        @comment.topic_id = params[:topic_id]
        @comment.user_id = current_user.id
    end


      
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      redirect_to topics_path, danger: 'コメントの登録に失敗しました'
    end
  end

  def destroy
    Comment.find_by(id: params[:id], topic_id: params[:topic_id] ).destroy
    redirect_to topic_path(params[:topic_id])
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id, :comment)
  end
  
end

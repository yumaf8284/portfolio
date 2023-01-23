class TopicsController < ApplicationController

  before_action :baria_user, only: [:edit, :destroy, :update]

  def index
    @topics = Topic.all
    @topics = Topic.all.order(created_at: :desc)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
       redirect_to topics_path, success: '編集に成功しました'
    else
      flash.now[:danger] = "編集に失敗しました"
      render :new
    end
  end 

  def destroy
    @topic = Topic.find(params[:id])
   if @topic.destroy
      redirect_to topics_path, success: '削除しました'
   else
    flash.now[:danger] = "編集に失敗しました"
    render :new
   end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :body)
  end

  def baria_user
    unless Topic.find(params[:id]).user.id.to_i == current_user.id
        redirect_to topics_path(current_user)
  end
 end
end
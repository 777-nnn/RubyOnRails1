class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :posts
    else
      flash.now[:alert] = "スケジュールの登録に失敗しました"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "スケジュール「#{@post.id}」の情報を更新しました"
      redirect_to :posts
    else
      flash.now[:alert] = "スケジュールの更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :start_date,
      :end_date,
      :is_all_day,
      :schedule_memo
    )
  end

end
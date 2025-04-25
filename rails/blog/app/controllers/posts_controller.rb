class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @users = User.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      @users = User.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    @users = User.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      @users = User.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end

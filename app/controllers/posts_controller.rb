class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
      @post = Post.new
      @current_user = current_user
    end

    def create
    post = Post.new(post_params)
    # post[:user_id] = current_user.id
    # post[:topic_id] = params[:id].to_i
    puts post.inspect

    if post.save
      redirect_to posts_path
    else
      puts post.errors.messages
      flash[:notice]=post.errors.messages
      render :new
    end
  end


  def show
    post_id = params[:id]
    @post = Post.find_by_id(post_id)
  end

  def edit
    post_id = params[:id]
    @post = Post.find_by_id(post_id)
  end


  def update
    post_id = params[:id]
    post = Post.find_by_id(post_id)
    post.update_attributes(post_params)
    redirect_to post_path(post_id)
  end

  def destroy
    post_id = params[:id]
    post = Post.find_by_id(post_id)
    post.destroy
    redirect_to posts_path
  end

  private

def post_params
  params.require(:post).permit(:title,:description,:location)
end


end

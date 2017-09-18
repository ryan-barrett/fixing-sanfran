class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
      @post = Post.new
      @current_user = current_user
    end

  def create
    post = Post.new(post_params)  #issue: unable to submit post unless signed in
    if @current_user == false
      post[:user_id] = 0
    else
      post[:user_id] = current_user.id
    end
    puts post.inspect

    puts post.errors.messages
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

  def map
    post_id = params[:id]
    @posts = Post.all
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
  params.require(:post).permit(:title,:description,:location,:user_id,:longitude,:latitude, :image, :type)
end


end

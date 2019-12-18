class PostsController < ApplicationController

  def index
    authorize :post
    @posts = Post.paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

<<<<<<< HEAD
  def create
    puts post_params
    @post = Post.new(post_params)
    authorize @post
=======
   def create
    # render plain: params[:post].inspect
     @post = Post.new(post_params.merge(user_id: current_user.id))
>>>>>>> 80afbad25d990fa4b86db0725cf25fe46eb54dd6
    if(@post.save)
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end
end

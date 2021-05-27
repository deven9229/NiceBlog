class PostsController < ApplicationController

  def index
    authorize :post
    @posts = Post.paginate(page: params[:page]).all.order(created_at: :desc)
    respond_to do |format| 
      format.html { render :index }
      format.json { render json: @posts }
    end  
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    puts post_params
    @post = Post.new(post_params)
    authorize @post
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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

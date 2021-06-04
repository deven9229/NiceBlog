class Api::PostsController < ApplicationController
   skip_before_action :verify_authenticity_token
   
  def index
    authorize :post
    @posts = Post.paginate(page: params[:page]).all.order(created_at: :desc)
    respond_to do |format| 
      format.json { render json: @posts }
    end  
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.json { render :json => @post.to_json }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.json { render json: @post }
      else
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
    params.require(:post).permit(:title, :body)
  end
end

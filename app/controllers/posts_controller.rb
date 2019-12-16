class PostsController < ApplicationController

   def index
     authorize @posts
     @posts = Post.paginate(page: params[:page])
   end

   def show
      @post = Post.find(params[:id])
   end

   def new
      @post = Post.new
   end

   def create
    # render plain: params[:post].inspect
      authorize @post
      @post = Post.new(post_params)
      if(@post.save)
        redirect_to @post
      else
        render 'new'
   end
 end

    def edit
      authorize @post
      @post = Post.find(params[:id])

    end

 def update
   authorize @post
   @post = Post.find(params[:id])
   if @post.update(post_params)
   redirect_to @post
   else
   render 'edit'
  end
end

  def destroy
    authorize @post
    @post = Post.find(params[:id])
  
    @post.destroy
    redirect_to posts_path
 end

private

def post_params
     params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
end
end

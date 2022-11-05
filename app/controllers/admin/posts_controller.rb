class Admin::PostsController < Admin::BaseController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all.sample(3)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(permitted_params)
    if post.save!
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update!(permitted_params)
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private

  def permitted_params
    params.require(:post).permit(:title, :content, :image, :user_id)
  end
end

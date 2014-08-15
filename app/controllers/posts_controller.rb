class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

=begin
  http_basic_authenticate_with name: "Mario", password: "rusty1984", except: [:index, :show]
=end
 
  def index
    @posts = Post.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @posts = Post.all.order("created_at DESC").paginate(:page => params[:page])
  end


  def new
    @post = current_user.posts.build
  end
   
  def create
    @post = current_user.posts.build(post_params)
   
      if @post.save
        redirect_to @post
      else
        render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
   
    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end 

  def destroy
    @post.destroy
   
    redirect_to posts_url
  end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:image, :title, :text)
      end

      def correct_user
        @post = current_user.posts.find_by(id: params[:id])
        redirect_to posts_path, notice: "Not authorized to edit this post" if @post.nil?
      end
  end

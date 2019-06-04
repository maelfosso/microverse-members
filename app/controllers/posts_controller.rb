class PostsController < ApplicationController
  before_action :connected_user, only: [:create, :new]

  def index
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = @current_user

    if @post.save
      flash[:success] = "Post successfully created"
      render 'index'
    else
      flash[:danger] = "Invalid form element"
      debugger
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:story)
  end

end

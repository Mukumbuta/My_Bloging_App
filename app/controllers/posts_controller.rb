class PostsController < ApplicationController
  def index
    @posts = 'These are the different posts for a particular user '
  end

  def show
    @post = "This is a post whose id is #{params[:id]}"
  end
end

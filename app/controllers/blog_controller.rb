class BlogController < ApplicationController
  def index
    @posts = Post.order(:post_date => 'DESC')
  end
end

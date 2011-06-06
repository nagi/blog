class BlogController < ApplicationController
  def index
    @posts = Post.all.order(:post_date => 'DESC')
  end
end

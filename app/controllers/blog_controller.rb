class BlogController < ApplicationController
  def index
    @posts = Post.find(:all, :order => "post_date DESC")
  end
end

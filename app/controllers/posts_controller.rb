class PostsController < ApplicationController
  def index
    render JSON: Post.all
  end
end
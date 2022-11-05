# frozen_string_literal: true

# Add documentation here
class HomeController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).limit(3)
  end
end

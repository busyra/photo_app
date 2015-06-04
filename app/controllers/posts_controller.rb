class PostsController < ApplicationController
	
	def index
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
	end

	def edit
	end

	def update
	end

	def pin_params
		params.require(:post).permit(:title, :description)
	end

end

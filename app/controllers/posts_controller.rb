class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authorized?, except: :index

	# index for main page will show in reverse (newest up top)
	def index
		@post = Post.all.order("created_at DESC")
	end
	# shows individual posts
	def show
		@img = EXIFR::JPEG.new(@post.image.path)
		#before_action find_post will help display
	end
	# creats posts
	def new
		@post = Post.new
	end

	# creates posts
	def create
		@post = Post.new(post_params)
		@post.user = current_user

		# flash message when successful 
		@post.user = current_user
		if @post.save
			redirect_to @post, notice: "Successfully created new post!"
		else
			render 'new'
		end
	end

	def edit
	end
	# updates posts
	def update
		#flash message when sucessful
		if @post.update(post_params)
			redirect_to @post, notice: "Successfully updated!"
		else 
			render 'edit'
		end
	end

	#logs out user and sends to main page
	def destroy
		@post.destroy
		redirect_to root_path
	end
	
	private

	def post_params
		params.require(:post).permit(:title, :description, :image)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end

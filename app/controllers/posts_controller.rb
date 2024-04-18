class PostsController < ApplicationController
    before_action :set_post, only: [:update, :destroy]
    # before_action :authenticate_request

    # GET /posts
    def index
      @posts = Post.all
      render json: @posts, status: :ok
    end  

    # GET posts/1
    def show
      @post = Post.find(params[:id])
      render json: @posts, status: :ok
    end
 
   # POST /posts 
   def create
     @post = Post.create(post_params)
     if @post.save
      render json: PostBlueprint.render(post, view: :normal), status: :created
       #render json: @post, status: :created, location: @posts
     else
       render json: @post.errors, status: :unprocessable_entity
     end
   end
 
   # PATCH/PUT /posts/1
   def update  
     if @post.update(post_params)
       render json: @post, status: :ok
     else
       render json: @post.errors, status: :unprocessable_entity
     end
   end
 
   # DELETE /posts/1
   def destroy
     if @post.destroy!
      render json: nil, status: :ok
     end
       render json: @post.errors, status: :unprocessable_entity
   end
# localhost:3000/users/1/posts/1/comments
def comments_index
   post = Post.find(params[:user_id])
   post_comments = post.comments
   render json: post_comments, status: :ok
end
   
  private
 
   def set_post
     @post = Post.find(params[:id])
   end
 
   def post_params #remove require post?
     params.require(:post).permit(:photo, :description, :location, :status, :user_id)
   end
 end

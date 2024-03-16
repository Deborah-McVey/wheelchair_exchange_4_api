class PostsController < ApplicationController
    before_action :set_post, only: [:update, :destroy]
    # before_action :authenticate_request

    def index
      posts = Post.all
      render json: posts, status: 200
    end  
 
   def create
     post = Post.new(post_params)
     if post.save
       render json: post, status: :created
     else
       render json: post.errors, status: :unprocessable_entity
     end
   end
 
   def update  
     if @post.update(post_params)
       render json: @post, status: :ok
     else
       render json: @post.errors, status: :unprocessable_entity
     end
   end
 
   def destroy
     if @post.destroy
       render json: @post.errors, status: :unprocessable_entity
   end
   
   private
 
   def set_post
     @post = Post.find(params[:id])
   end
 
   def post_params
     params.permit(:photo, :description, :location, :status, :user_id)
   end
 end
end
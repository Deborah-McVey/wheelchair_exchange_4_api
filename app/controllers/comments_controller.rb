class CommentsController < ApplicationController
    before_action :set_comment, only: [:update, :destroy]
    #before_action :authenticate_request
 
   # GET /comments
    def index 
      @comments = Comment.all
      render json: @comments, status: :ok
    end
   
   # GET /comments/1
    def show
      @comment = Comment.find(params[:id])
      render json: @comments, status: :ok
    end

   # POST /comments 
   def create
     comment = Comment.create(comment_params)
     if comment.save
       render json: comment, status: :created, location: @comments
     else
       render json: comment.errors, status: :unprocessable_entity
     end
   end
 
   # PATCH/PUT /comments/1
   def update  
     if @comment.update(comment_params)
       render json: @comment, status: :ok
     else
       render json: @comment.errors, status: :unprocessable_entity
     end
   end
 
   #DELETE /comments/1
   def destroy
     if @comment.destroy!
      render json: nil, status: :ok
     end
       render json: @comment.errors, status: :unprocessable_entity
   end

   private
 
   def set_comment
     @comment = Comment.find(params[:id])
   end
 
   def comment_params
     params.require(:comment).permit(:body, :user_id, :post_id)
   end
  end
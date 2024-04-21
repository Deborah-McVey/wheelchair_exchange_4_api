class PostsController < ApplicationController
    before_action :set_post, only: [:update, :destroy]
    # before_action :authenticate_request

    # GET /posts
    #def index
    #  @posts = Post.all
    #  render json: @posts, status: :ok
    #end  
    # Adding pagination
    #def index
    #  page = params.fetch(:page, 1).to_i
    #  per_page = params.fetch(:per_page, #10).to_i
    
    #  offset = (page - 1) * per_page
    
    #  posts = Post.offset(offset).limit#(per_page)
    
    #  render_success(payload: #PostBlueprint.render_as_hash(posts, #view: :normal, current_user: #@current_user), status: :ok)
    #end
  # update to use post service now
  # Try sending a request to localhost:3000/blogs?page=1page_per=4. You should see the first 4 blogs in the response.
  def index
    result = PostService::Base.filter(params)
    if result.success?
      render_success(payload: PostBlueprint.render_as_hash(result.payload, view: :normal, current_user: @current_user), status: :ok)
    else 
      render_error(errors: result.errors, status: :unprocessable_entity)
    end
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

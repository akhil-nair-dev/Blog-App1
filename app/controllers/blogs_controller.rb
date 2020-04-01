class BlogsController < ApplicationController

	def new
		@blog = Blog.new
	end

  def index
    @blogs = Blog.all
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
  	@blog = current_user.blogs.new(blog_params)
		if @blog.save
			flash[:success] = "Blog saved"
      redirect_to blogs_url
		else
			render :new
    end
  end

  
  def show
    @blog = Blog.find params[:id]
	end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to blogs_url
end

def like
    @blog = Put.find(params[:id])
    @blog.upvote_by current_user
    render layout: false
    # @blog = Blog.find(params[:id])
    # @blog.likes.create(user: current_user, like: params[:like])
    # flash[:success] = "Like Counted!"
    # render :show   
end

def follow
  @user = User.find(params[:id])
  current_user.follow(@user)
    # @current_user.follow(@blog.user)
    # @follow = Follow.find_by(follower: current_user, followable: @user)
    # respond_to :js
end


def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
end


  private
	
	def blog_params
		params.require(:blog).permit(:title, :description)
	end
end

class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]  
    before_action :set_post, only: [:edit, :update, :destroy]
    def index
        @posts = Post.all
    end
    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end     

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to posts_path
        else
            render 'edit'
        end
    end

    def destroy 
        @post = Post.find(params[:id])
    
        @post.destroy
        redirect_to posts_path
        
    end

    def create
        @post = Post.new(post_params)
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
        

    end
    
    private def post_params
        params.require(:post).permit(:title, :content)        
    end
    
    private def set_post
        @post = current_user.posts.find(params[:id])        
    end
end
class CommentsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]  
    before_action :set_comment, only: [ :destroy]
    def new
        @comment = Comment.new

    end
    
    def create
        @post = Post.find(params[:post_id])
        @comment = current_user.comments.new(comment_params)
        @comment.post = @post
        @comment.save
        redirect_to post_path(@post)
        
    end

    def destroy 
        @comment = Comment.find(params[:id])
        @comment.destroy
        
    
    end

    private def comment_params
        params.require(:comment).permit(:content)
        
    end
    private def set_comment
       
        
    end

    
end

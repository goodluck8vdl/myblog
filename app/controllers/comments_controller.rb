class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :body))
        if @comment.save
            flash[:notice] = "Comment has been created."
            redirect_to @post
        else
            flash.now[:danger] = "error"
        end
    end
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
    
    def comment_params_with_post
        comment_params.merge(post: @post)
    end
  
end

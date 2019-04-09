class CommentsController < ApplicationController

    def new
        render :new
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.post_id = params[:comment][:post_id]
        if @comment.save
            redirect_to post_url(@comment.post)
        else
            flash.now[:errors] = @comment.errors.full_messages
            redirect_to post_url(@comment.post)
        end
    end

    def show
        @comment = Comment.find(params[:id])
        render :show
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :parent_comment_id)
    end 

end

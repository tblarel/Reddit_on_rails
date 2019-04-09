class PostsController < ApplicationController

    before_action :require_logged_in, except:[:show]

    def new
        @post = Post.new()
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy if @post.user_id == current_user.id
        redirect_to sub_url(@post.sub)
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])
        
        @post.update_attributes(post_params) if @post.user_id == current_user.id
        flash[:errors] = @post.errors.full_messages
        redirect_to post_url(@post)
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    private

    def post_params
        params.require(:post).permit(:title,:url,:content, sub_ids: [])
    end

end

class SubsController < ApplicationController

    before_action :require_logged_in, except: [:index, :show]

    def new
        render :new
    end
    
    def create
        @sub = Sub.new(sub_params)
        @sub.user_id = current_user.id 

        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            redirect_to new_sub_url
        end
    end

    def destroy
        @sub = Sub.find(params[:id])
        @sub.destroy if @sub.user_id == current_user.id
        redirect_to subs_url
    end


    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end
    
    def update
        @sub = Sub.find(params[:id])

        @sub.update_attributes(sub_params) if @sub.user_id == current_user.id
        flash[:errors] = @sub.errors.full_messages
        redirect_to sub_url(@sub)
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end


    def index
        @subs = Sub.all 
        render :index
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end

end

class PostsController < ApplicationController

    skip_before_action :require_login, only: [:create]

    def index
        @user = User.find(session[:user_id])
        @posts = Post.all
    end

    def show
        @posts = Post.find(params[:id])
        @post_liked = Post.find(params[:id]).users
    end

    def create
        post = Post.new( post_params )
        unless post.save
            flash[:errors] = secret.errors.full_messages
        end
        redirect_to "/bright_ideas"
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy if @post.user === current_user
        redirect_to "/bright_ideas"
    end

    private
        def post_params
            params.require(:post).permit(:post).merge(user: current_user)
        end


end

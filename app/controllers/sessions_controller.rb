class SessionsController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]

    def new
    end

    def create
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to "/bright_ideas"
        else 
            flash[:errors] = ["Invalid Combination"]
            redirect_to "/main"
        end
    end

    def destroy
        reset_session
        redirect_to :root
    end
end

class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show
            redirect_to root_path unless current_user

            @user = current_user
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :new
        end
    end

    private

    def user_params
      params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :admin, :password)
    end
end

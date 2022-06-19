class UsersController < ApplicationController
    def new
    end
    def index
        @log_in_user = current_user
        @mybooks = @log_in_user.books
        @users = User.all
        @new_book = Book.new
    end
    
    def show
        @user = User.find(params[:id])
        @new_book = Book.new
        @books = @user.books
        @post_image = @user.profile_image
        
    end
    
    def edit
        @user = User.find(params[:id])
        
        unless current_user.id == @user.id
            redirect_to user_path(current_user.id)
        end
    end
    
    def update
        # @user = ユーザーの取得
        # @user.ユーザーのアップデート
        # redirect_to ユーザーの詳細ページへのパス  
        @user = User.find(params[:id])
        @user.update(user_params)
        
        if @user.update(user_params)
          flash[:notice] = "You have updated user successfully."
          redirect_to user_path(current_user.id)
        else
          render :edit
        end
        
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
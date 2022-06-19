class FavoritesController < ApplicationController
    def create
        # 用途：いいねを作成する
        @book = Book.find(params[:book_id])
        @book_favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
        @book_favorite.save
        @count = Favorite.all
        redirect_to request.referer
        
    end
    
    def destroy
        # 用途：いいねを削除する
        @book = Book.find(params[:book_id])
        @book_favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
        @book_favorite.destroy
        @count = Favorite.all
        redirect_to request.referer
        
    end
end

class BooksController < ApplicationController
    def index
        @books = Book.all
        @user = current_user
        @new_book = Book.new
    end
    
    
    def create
        @new_book = Book.new(book_params)
        @logging_in_user = current_user
        @new_book.user_id = @logging_in_user.id
        @user = @new_book.user
        
        if @new_book.save
          flash[:notice] = "You have created book successfully."
          redirect_to book_path(@new_book.id)
        else
          @books = Book.all
          render :index
        end
    end
    
    def show
        @new_book = Book.new
        @new_book_comment = BookComment.new
        @book = Book.find(params[:id])
        @user = @book.user
        @books = Book.all
    end
    
    def edit
        @book = Book.find(params[:id])     
        @user = @book.user
        unless current_user.id == @user.id
            redirect_to books_path
        end
    end
    
    def update
        @book = Book.find(params[:id])
        @user = @book.user
        
        if @book.update(book_params)
          flash[:notice] = "You have updated book successfully."
          redirect_to book_path(@book.id)
        else
          render :edit
        end
    end
    
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end
        

    
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
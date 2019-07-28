class BooksController < ApplicationController

before_action :authenticate_user!
before_action :correct_user,   only: [:edit, :update]



  def show
  	@booknew = Book.new
  	@user = current_user
  	@book = Book.find(params[:id])



  end
  #  一覧機能
  def index
		@book = Book.new

        @books = Book.all
        # createアクションを呼び出す
        @user = current_user

  end


def create
	@book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
       flash[:notice] = "You have creatad book successfully."
    redirect_to book_path(@book.id)
	else
	@books = Book.all
	@user = current_user
	render 'books/index'
	end


end






  def edit

  	@book = Book.find(params[:id])




  end


  def destroy
          book = Book.find(params[:id])
          book.destroy
          redirect_to books_path


        end


def update

	@book =Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to book_path(@book.id)
    else
    render 'books/edit'


    end

end





private


 def book_params
	params.require(:book).permit(:title, :body)

 end



 def correct_user
           book = Book.find(params[:id])
           if current_user != book.user
           redirect_to books_path
           end

        end



end

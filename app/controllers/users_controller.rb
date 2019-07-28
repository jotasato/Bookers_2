class UsersController < ApplicationController

 before_action :authenticate_user!
 before_action :correct_user, only: [:edit, :update]




  def index

    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
  	@user = current_user
    @book = Book.new
    @user = User.find(params[:id])
    @booksecond = @user.books


  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
     	flash[:notice] = "You have updated user successfully."

        redirect_to user_path(@user.id)
     else
     	 render 'users/edit'
     end

  end
  def create
	book = Book.new(book_params)
           book.save
           redirect_to book_path

   end





		  private

			  def user_params
				params.require(:user).permit(:name,:introduction,:profile_image)

			  end


		    def correct_user
		       user = User.find(params[:id])
		       if current_user != user
		       redirect_to user_path(current_user)
		       end

		    end


end



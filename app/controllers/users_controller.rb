class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    else
      render 'new'
    end
  end



  private
    #etot metod tuzhen dlja peredachi na server tol'ko razreshennyh atributov
    #odin iz sposobov zaschity
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

class UsersController < ApplicationController

  #predfil'try dlja zascity stranic userov
  before_action :zaloginen, only: [:edit, :update, :show]
  before_action :korrektnyj, only: [:edit, :update,:show]

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
      log_in @user
      flash[:succes] = "Добро пожаловать в Blocknode!!!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:succes] = "Profil' obnovlen!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    #etot metod tuzhen dlja peredachi na server tol'ko razreshennyh atributov
    #odin iz sposobov zaschity
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    #predfil'tr, podtveerzhdajuscij korrektnost' usera
    def korrektnyj
      @user = User.find(params[:id])
      redirect_to(home_url) unless current_user?(@user)
    end

end

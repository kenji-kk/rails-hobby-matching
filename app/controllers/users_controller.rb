class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user =  User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMilerMailer.with(to: @user.email, name: @user.name).welcome.deliver_now
      redirect_to @user
    else 
      render 'new'
    end
  end

  def edit
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_cofirmation)
    end
end

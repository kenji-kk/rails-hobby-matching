class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all.order(created_at: "DESC")
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
      log_in @user
      flash[:success] = "アカウント作成に成功しました。"
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
    if @user.update(user_params)
      flash[:success] = "ユーザ情報を更新しました。"
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio)
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end

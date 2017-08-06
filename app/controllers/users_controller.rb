class UsersController < ApplicationController
before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
    
  def list
    @msg = 'Users cont. list アクション'
    @users = User.all
  end
  
  def index
    @msg = 'Users cont. index アクション'
    @user = User.find(params[:id])
  end
  
  def show
    @msg = 'Users cont. show アクション'
    @user = User.find(params[:id])
  end
  
  def edit
  @msg = 'Users cont. edit アクション'
  end
  
  def new
    @msg = 'Users cont. new アクション'
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
       log_in @user
      flash[:success] = "Welcome to the SressShedder App!"
       redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @micropost = Micropost.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

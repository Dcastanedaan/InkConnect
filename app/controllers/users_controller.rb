class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :requires_admin, except: [:index, :show]

  def authorize_admin!
    redirect_to root_path unless current_user.admin? 
  end

  def index
    @users = User.all.includes(tattoo_artist: :portfolios).order(created_at: :desc)
    @user = User.new if current_user.admin?
  end

  def create_by_admin
    @user = User.new(user_params)

    if @user.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to users_path, notice: "Usuario creado" }
      end
    else
      @users = User.all
      render :index, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)

    # generated_password = Devise.friendly_token.first(8)
    # before_action :authorize_admin!
    # Devise requiere password sí o sí
    # generate_password = Devise.friendly_token
    # @user.password = params[:user][:password] if params[:user][:password].present?

    if @user.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to users_path, notice: "Usuario creado" }
      end
    else
      @user.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to users_path }
      end
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def requires_admin
    redirect_to root_path, alert: "No autorizado" unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :role)
  end
end

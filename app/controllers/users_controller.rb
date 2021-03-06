class UsersController < ApplicationController
  def index
    @page_title = if current_user
                    'START'
                  else
                    'SIGN IN'
                  end
  end

  def new
    @page_title = 'SIGN UP'
    @user = User.new
  end

  def create
    @user = User.new(name: user_params[:name], username: user_params[:username])
    unless user_params[:image_file].nil?
      uploaded_file = Cloudinary::Uploader.upload(user_params[:image_file])
      @user.avatar = uploaded_file['secure_url']
    end

    if @user.save
      flash[:notice] = 'You are signed up. Now you can sign in!'
      redirect_to users_path
    else
      @page_title = 'SIGN UP'
      flash.now[:error] = @user.errors.full_messages.join('. | ').to_s
      render new_user_path
    end
  end

  def signin
    user = User.where(username: user_params[:username])[0]
    if user
      session[:user_id] = user.id
      redirect_to(root_path, notice: 'You are signed in!')
    else
      redirect_to(new_user_path, alert: 'Invalid username!. You must sign up to continue.')
    end
  end

  def signout
    session[:user_id] = nil
    redirect_to(root_path, danger: 'You are signed out!')
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :avatar, :image_file)
  end
end

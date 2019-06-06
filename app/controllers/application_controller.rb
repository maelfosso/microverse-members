class ApplicationController < ActionController::Base
  def index
    redirect_to('/posts')
  end

  def signin
    @error = {}
    user = User.find_by_email(params[:session][:email])
    if user
      user.authenticate(params[:session][:password]) ?
        (return remember(user)) : @error[:password] = 'Wrong password'
    else
      @error[:email] = "This email doesn't exist"
    end
    false
  end

  def signout
    session.delete(:user_id)
    current_user.update_attribute(:remember_token, nil)
    current_user = nil
  end

  def remember(user)
    user.update_attribute(:remember_token,
                          Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64))
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def current_user
    user = User.find_by(id: cookies.signed[:user_id])
    @current_user ||= user&.remember_token == cookies[:remember_token] ? user : nil
  end

  def current_user=(user)
    @current_user = user
  end

  # Authentiction and Post
  def connected_user
    current_user
    if @current_user.nil?
      flash[:danger] = "Please, you must sign in to create a post"
      redirect_to signin_url
    end
  end
end

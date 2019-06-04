class SessionsController < ApplicationController
  def show
    current_user
  end

  def new
  end

  def create
    if signin
      redirect_to(root_path)
    else
      flash.alert = 'Wrong entry, try again!'
      render('new')
    end
  end

  def delete
    signout
    redirect_to '/signin'
  end
end

class SessionsController < ApplicationController
  def show
    current_user
  end

  def new
  end

  def create
    signin ? redirect_to(root_path) : render('new')
  end

  def delete
    signout
    redirect_to '/signin'
  end
end

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
      render('new')
    end
  end

  def delete
    signout
    redirect_to '/posts'
  end
end

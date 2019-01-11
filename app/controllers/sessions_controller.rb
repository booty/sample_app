class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:info] = "Welcome back, you stud"
      redirect_to user
    else
      flash.now[:danger] = "You fucking up dude! Invalid email/password. In fact, you're invalid!"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

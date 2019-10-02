class SessionsController < ApplicationController
  def new
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @current_user }
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to 'Show', notice: "Logged in!"
    else
      notice: "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end

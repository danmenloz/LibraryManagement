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
      @current_user = user
      redirect_to :home, notice: "Logged in!"
    else
      render "new", notice: "Email or password is invalid"
    end
  end

  def destroy
    @current_user = nil
    redirect_to root_url, notice: "Logged out!"
  end
end

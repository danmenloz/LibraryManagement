class SessionsController < ApplicationController
  def new
    @current_user =  current_user # call helper method
    unless @current_user.nil?
      redirect_to :home # go to dashboard
    end
  end

  def show
    @current_user =  current_user # call helper method
    if @current_user.nil?
      redirect_to :root #go to sign up page
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: :current_user }
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :home, notice: "Welcome " + user.name + "!"
    else
      render "new", notice: "Email or password is invalid"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end

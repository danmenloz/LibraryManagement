class AdminsController < ApplicationController
  
  def admin_params
    params.require(:admin).permit(:email, :name, :password)
  end

  def index
    @admins = Admin.all

    respond_to do |format|
      format.html
      format.json { render json: @admins }
    end
  end

  def show
    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @admin }
    end
  end

  def new
    @admin = Admin.new

    respond_to do |format|
      format.html
      format.json { render json: @admin }
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render json: @admin, status: :created, location: @admin }
      else
        format.html { render action: "new" }
        format.json { render json: @admin.errors, status :unprocessable_entity }
      end
    end
  end

  def update
    @admin = Admin.find(params[:id])

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end
end

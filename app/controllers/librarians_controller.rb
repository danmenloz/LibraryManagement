class LibrariansController < ApplicationController
  
  def librarian_params
    params.require(:librarian).permit(:email, :name, :password, :library_id)
  end
  
  def index
    @librarians = Librarian.all

    respond_to do |format|
      format.html
      format.json { render json: @librarians }
    end
  end

  def show
    @librarian = Librarian.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @librarian }
    end
  end
  
  def new
    @librarian = Librarian.new

    respond_to do |format|
      format.html
      format.json { render json: @librarian }
    end
  end

  def edit
    @librarian = Librarian.find(params[:id])
  end

  def create
    @librarian = Librarian.new(librarian_params)

    respond_to do |format|
      if @librarian.save
        format.html { redirect_to @librarian, notice: 'Librarian was successfully created.' }
        format.json { render json: @librarian, status: :created, location: @librarian }
      else
        format.html { render action: "new" }
        format.json { render json: @librarian.errors, status :unprocessable_entity }
      end
    end
  end
  
  def update
    @librarian = Librarian.find(params[:id])

    respond_to do |format|
      if @librarian.save
        format.html { redirect_to @librarian, notice: 'Librarian was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @librarian.errors, status :unprocessable_entity }
      end
    end
  end

  def destroy
    @librarian = Librarian.find(params[:id])
    @librarian.destroy

    respond_to do |format|
      format.html { redirect_to librarians_url }
      format.json { head :no_content }
    end
  end
end

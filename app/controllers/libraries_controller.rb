class LibrariesController < ApplicationController

  def library_params
    params.require(:library).permit(:name, :university, :location, :max_days, :overdue_fines)
  end

  def index
    @libraries = Library.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @libraries }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @library = Library.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @library }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @library = Library.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @library }
    end
  end

  # GET /categories/1/edit
  def edit
    @library = Library.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    # render plain: params[:library].inspect
    @library = Library.new(library_params)

    # @library.save
    # redirect_to @library

    respond_to do |format|
      if @library.save
        #redirect to show
        format.html { redirect_to @library, notice: 'Library was successfully created.' }
        format.json { render json: @library, status: :created, location: @library }
      else
        format.html { render action: "new" }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @library = Library.find(params[:id])

    respond_to do |format|
      if @library.update_attributes(library_params)
        format.html { redirect_to @library, notice: 'Library was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @library = Library.find(params[:id])
    @library.destroy

    respond_to do |format|
      format.html { redirect_to libraries_url }
      format.json { head :no_content }
    end
  end

end
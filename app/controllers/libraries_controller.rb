class LibrariesController < ApplicationController

  def library_params
    params.require(:library).permit(:name, :university, :location, :max_days, :overdue_fines)
  end

  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @library }
    # end

  end

  def new

  end

  def create
    # render plain: params[:library].inspect
    @library = Library.new(library_params)

    @library.save
    redirect_to @library


    # respond_to do |format|
    #   if @library.save
    #     #redirect to show
    #     format.html { redirect_to @library, notice: 'Library was successfully created.' }
    #     format.json { render json: @library, status: :created, location: @library }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @library.errors, status: :unprocessable_entity }
    #   end
    # end
  end

end

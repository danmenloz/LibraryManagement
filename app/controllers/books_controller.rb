class BooksController < ApplicationController

  def index
    @current_user =  current_user # call helper method
    @list = params[:list] # retrieve list parameter from hash

    @books = if (params[:search_title] || params[:search_author] || params[:search_subject] || params[:search_published] )
               if (params[:search_published]=="")
                 Book.where('lower(title) LIKE ? and lower(author) LIKE ? and lower(subject) LIKE ?', "%#{params[:search_title].downcase}%","%#{params[:search_author].downcase}%","%#{params[:search_subject].downcase}%")
               elsif (params[:search_published]!="")
                 Book.where(:published =>  params[:search_published])
               end
             else
               Book.all
             end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
    @requests = HoldRequest.where(book_id: @book.id)
    @current_user = current_user # call helper method
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        #redirect to show
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

private

  def book_params
    params.require(:book).permit(:isbn, :title, :author, :language,
                                 :published, :edition, :cover, :subject,
                                 :summary, :special, :copies, :library_id)
  end


end

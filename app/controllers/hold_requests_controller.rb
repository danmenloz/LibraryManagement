class HoldRequestsController < ApplicationController
  before_action :set_hold_request, only: [:show, :edit, :update, :destroy]

  # GET /hold_requests
  # GET /hold_requests.json
  def index
    @hold_requests = HoldRequest.all
  end

  # GET /hold_requests/1
  # GET /hold_requests/1.json
  def show
    @book = Book.find(@hold_request.book_id)
    @user = User.find(@hold_request.user_id)
  end

  # GET /hold_requests/new
  def new
    @hold_request = HoldRequest.new
    @book = Book.find(params[:book_id])
    @user = User.find(params[:user_id])
  end

  # GET /hold_requests/1/edit
  def edit
  end

  # POST /hold_requests
  # POST /hold_requests.json
  def create

    @hold_request = HoldRequest.new(hold_request_params)
    book = @hold_request.get_book
    user = current_user # helper method
    notice_msg = 'Hold request created!'

    # *** Error checks ***
    # Only students/admin can create hold requests
    if user.level != 'student' && user.level != 'admin'
      redirect_to request.referrer, alert: 'You are not allowed to create Hold Requests!'
      return
    end
    # Check duplicate hold requests
    if book.requested_by(user)
      redirect_to request.referrer, alert: 'You already have a request for this book!'
      #request.referrer is the same page
      return
    end
    # Check University
    if user.level == 'student'
      if user.university != book.library.university
        redirect_to request.referrer, alert: 'You can only borrow books from your University!'
        return
      end
    end


    # *** Complete Hold request entry ***
    @hold_request.copy = book.copies
    @hold_request.overdue_fine = 0
    if book.special
      @hold_request.status = 'approval' #requires librarian approval
      notice_msg = 'Hold Request created. Requires librarian approval.'
    else
      # Check existing books
      if book.copies == 0
        @hold_request.status = 'waitlist' # Hold request will be added into the wait list
        notice_msg = 'Your Hold Request created. Added to the wait list.'
      else
        @hold_request.status = 'checkout' # Hold request was successful
        notice_msg = 'Your Hold Request created. Checkout completed!'
        book.copies -= 1 # update book copies field
        book.update(copies: book.copies)
        @hold_request.copy = book.copies # update Hold Request field
        @hold_request.checkout_date = DateTime.now
        @hold_request.return_date = @hold_request.checkout_date.next_day(book.get_lib.max_days)
      end
      # Search [book_id, copy] in db to see if someone borrowed it
    end




    respond_to do |format|
      if @hold_request.save
      format.html { redirect_to @hold_request, notice: notice_msg }
      format.json { render :show, status: :created, location: @hold_request }
    else
      format.html { render :new }
      format.json { render json: @hold_request.errors, status: :unprocessable_entity }
    end
    end

  end

  # PATCH/PUT /hold_requests/1
  # PATCH/PUT /hold_requests/1.json
  def update
    respond_to do |format|
      if @hold_request.update(hold_request_params)
        format.html { redirect_to @hold_request, notice: 'Hold request was successfully updated.' }
        format.json { render :show, status: :ok, location: @hold_request }
      else
        format.html { render :edit }
        format.json { render json: @hold_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hold_requests/1
  # DELETE /hold_requests/1.json
  def destroy
    book = @hold_request.get_book
    book.copies += 1 # update book copies field
    book.update(copies: book.copies)

    @hold_request.destroy
    respond_to do |format|
      format.html { redirect_to hold_requests_url, notice: 'Hold request was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hold_request
      @hold_request = HoldRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hold_request_params
      # params.fetch(:hold_request, {})
      params.require(:hold_request).permit(:user_id, :book_id)
    end


end

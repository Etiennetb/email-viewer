class EmailsController < ApplicationController
  
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id]) 
    @emails = Email.all
    respond_to do |format|
      format.html # show.html.erb
    end
  end


  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  def create
    @email = Email.new(email_params)

    respond_to do |format|
      if @email.save
        format.html { redirect_to @email, notice: 'Email was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /emails/1
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @email, notice: 'Email was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /emails/1
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:object, :body)
    end
  end


class EmailsController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @emails = Email.all
  end
  
  def new
    @email = Email.new
  end
  
  def create
    @email = Email.new(params[:email])
    if @email.save 
      flash[:notice] = "Successfully created email."  
    end  
    respond_with(@email, location: edit_email_path(@email)) 
  end
  
  def edit
    @email = Email.find(params[:id])
  end
  
  def update
    @email = Email.find(params[:id])  
    if @email.update_attributes(params[:email])  
      flash[:notice] = "Successfully updated email."  
    end  
    respond_with(@email, location: edit_email_path(@email)) 
  end
end
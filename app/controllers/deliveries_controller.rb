class DeliveriesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end
  
  def show
    @delivery = Delivery.find(params[:id])
  end
  
  def new
    @delivery = Delivery.new
  end
  
  def create
    @delivery = Delivery.new(params[:delivery])
    if @delivery.save 
      flash[:notice] = "Successfully created delivery."  
    end  
    respond_with(@delivery, location: deliveries_path) 
  end
   
  def edit
    @delivery = Delivery.find(params[:id])
  end
  
  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update_attributes(params[:delivery])  
      flash[:notice] = "Successfully updated delivery."  
    end  
    respond_with(@delivery, location: deliveries_path) 
  end
  
  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy  
    flash[:notice] = "Successfully destroyed delivery."  
    respond_with(@delivery, location: deliveries_path)
  end
end
class DeliveriesController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_direction, :sort_column

  def index
    @deliveries = Delivery.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(per_page: 100, page: params[:page])
  end
  
  def show
    @delivery = Delivery.find(params[:id])
  end
  
  def new
    @delivery = Delivery.new
  end
  
  def create
    @delivery = Delivery.new(params[:delivery])
    body = @delivery.compile_body
    DeliveryMailer.dynamic_email(body, @delivery.email.subject, @delivery.prospect.email).deliver
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
  
  private
    
    def sort_column  
      Delivery.column_names.include?(params[:sort]) ? params[:sort] : "prospect_id"  
    end
end
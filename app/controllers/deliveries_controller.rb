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
    email = params[:email]
    prospects = params[:prospect].delete_if {|k,v| v == "0"}
    prospects.each do |prospect|
      delivery = Delivery.create(prospect_id: prospect[0], email_id: email[0])
      DeliveryMailer.dynamic_email(delivery.compile_body, delivery.email.subject, delivery.prospect.email).deliver
    end 
    redirect_to deliveries_path
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
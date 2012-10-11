class ProspectsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @prospects = Prospect.all
  end
  
  def show
    @prospect = Prospect.find(params[:id])
  end
  
  def new
    @prospect = Prospect.new
  end
  
  def create
    created = Prospect.upload(params[:file]) 
    flash[:notice] = "#{created} prospects were uploaded."  
    respond_with(@prospect, location: prospects_path) 
  end
   
  def edit
    @prospect = Prospect.find(params[:id])
  end
  
  def update
    @prospect = Prospect.find(params[:id])
    if @prospect.update_attributes(params[:prospect])  
      flash[:notice] = "Successfully updated prospect."  
    end  
    respond_with(@prospect, location: prospects_path) 
  end
  
  def destroy
    @prospect = Prospect.find(params[:id])
    @prospect.destroy  
    flash[:notice] = "Successfully destroyed prospect."  
    respond_with(@prospect, location: prospects_path)
  end
end
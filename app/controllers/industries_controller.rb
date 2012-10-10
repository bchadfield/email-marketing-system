class IndustriesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @industry = Industry.new
    @industries = Industry.all
  end
  
  def show
    @industry = Industry.find(params[:id])
  end
  
  def new
    @industry = Industry.new
  end
  
  def create
    @industry = Industry.new(params[:industry])
    if @industry.save 
      flash[:notice] = "Successfully created industry."  
    end  
    respond_with(@industry, location: industries_path) 
  end
   
  def edit
    @industry = Industry.find(params[:id])
  end
  
  def update
    @industry = Industry.find(params[:id])
    if @industry.update_attributes(params[:industry])  
      flash[:notice] = "Successfully updated industry."  
    end  
    respond_with(@industry, location: industries_path) 
  end
  
  def destroy
    @industry = Industry.find(params[:id])
    @industry.destroy  
    flash[:notice] = "Successfully destroyed product."  
    respond_with(@industry, location: industries_path)
  end
end
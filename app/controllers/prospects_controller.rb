class ProspectsController < ApplicationController
  respond_to :html, :xml, :json
  helper_method :sort_direction, :sort_column

  def index
    @prospects = Prospect.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(per_page: 100, page: params[:page])
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
  
  private
    
    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
    end 
    
    def sort_column  
      Prospect.column_names.include?(params[:sort]) ? params[:sort] : "company_name"  
    end
end
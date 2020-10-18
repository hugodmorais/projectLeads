class LeadsController < ApplicationController
  before_action :set_lead, only: %i[show edit update destroy]

  def index
    @leads = Lead.page(params[:page]).per(8).order(created_at: :desc)
  end

  def new
    @lead = Lead.new
  end

  def show
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      redirect_to @lead, notice: :created
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lead.update(lead_params)
      redirect_to @lead, notice: :updated
    else
      render :edit
    end
  end

  def destroy
    @lead.destroy
    
    respond_to do |format|
      format.html
      format.js { flash.now[:notice] = :destroyed }
    end
  end

  private

  def set_lead
    @lead = Lead.find(params[:id])
  end

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :zip_code)
  end
end

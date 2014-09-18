class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
  @company = Company.find(params[:id])
  @company_jobs = @company.jobs
  end

  def new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company
    else
      render 'new'
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :location, :industry, :description, :website)
  end
end

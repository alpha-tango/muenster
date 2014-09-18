class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
  @company = Company.find(params[:id])
  @company_jobs = @company.jobs
  end
end

class JobsController < ApplicationController

  def index
    @jobs = Job.order(updated_at: :desc)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to @job
    else
      render 'new'
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :company_id)
  end

end

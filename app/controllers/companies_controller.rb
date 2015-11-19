class CompaniesController < ApplicationController

  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def show
  end

  def edit
  end

  def update
    if @company.update(company_params)
      flash[:notice] = "Company has been updated."
      redirect_to @company
    else
      flash.now[:alert] = "Company has not been updated."
      render "edit"
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  rescue
    flash[:alert] = "The company you were looking for could not be found."
    redirect_to companies_path
  end

  def company_params
    params.require(:company).permit(:name)
  end
end
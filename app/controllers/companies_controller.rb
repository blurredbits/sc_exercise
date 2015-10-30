class CompaniesController < ApplicationController

  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.admin = current_user

    if @company.save
      flash[:notice] = "Company has been created."
      redirect_to @company
    else
      flash.now[:alert] = "Company has not been created."
      render "new"
    end
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

  def destroy
    @company.destroy
    flash[:notice] = "Company has been deleted."
    redirect_to companies_path
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
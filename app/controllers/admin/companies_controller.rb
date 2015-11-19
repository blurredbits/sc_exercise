class Admin::CompaniesController < Admin::ApplicationController

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

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "Company has been deleted."
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

end

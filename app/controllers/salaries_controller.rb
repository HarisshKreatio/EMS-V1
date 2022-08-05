class SalariesController < ApplicationController

  def edit
    if admin_signed_in?
    @salary = Salary.find(params[:id])
  else
    redirect_to admin_session_path
  end
  end

  def update
    @salary = Salary.find(params[:id])
    if @salary.update(salary_params)
      flash[:notice] = "Employee details was updated successfully"
      if admin_signed_in?
        redirect_to home_path(@salary.employee.id)
      else
        redirect_to root_path
      end
    else
      render edit_salary_path
    end
  end

  private

  def salary_params
    params.require(:salary).permit( :basic_pay, :hra, :statutory_bonus, :special_allowance, :employee_id)
  end

end
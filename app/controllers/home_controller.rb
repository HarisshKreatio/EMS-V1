class HomeController < ApplicationController

  def index
    @employees = Employee.all
    if employee_signed_in?
      @one_employee = Employee.find(current_employee.id)
      @total_leave = @one_employee.leave.sick.to_i + @one_employee.leave.privileged.to_i + @one_employee.leave.breavement.to_i + @one_employee.leave.study_leave.to_i + @one_employee.leave.time_off.to_i + @one_employee.leave.maternity.to_i + @one_employee.leave.paternity.to_i + @one_employee.leave.optional.to_i
      @total_salary = @one_employee.salary.basic_pay.to_i + @one_employee.salary.hra.to_i + @one_employee.salary.statutory_bonus.to_i + @one_employee.salary.special_allowance.to_i
    end
  end

  def about
  end

  def show
    if admin_signed_in?
    @employee = Employee.find(params[:id])
    @total_leave = @employee.leave.sick.to_i + @employee.leave.privileged.to_i + @employee.leave.breavement.to_i + @employee.leave.study_leave.to_i + @employee.leave.time_off.to_i + @employee.leave.maternity.to_i + @employee.leave.paternity.to_i + @employee.leave.optional.to_i
    @total_salary = @employee.salary.basic_pay.to_i + @employee.salary.hra.to_i + @employee.salary.statutory_bonus.to_i + @employee.salary.special_allowance.to_i
    else
      redirect_to admin_session_path
    end
  end

  def edit
    if admin_signed_in?
      @employee = Employee.find(params[:id])
    else
      redirect_to admin_session_path
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:notice] = "Employee details was updated successfully"
      redirect_to home_path(@employee.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to root_path
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :dob, :phone_number, :gender, :martial_status, :blood_group, :fathers_name, :mothers_name, :address)
  end



end


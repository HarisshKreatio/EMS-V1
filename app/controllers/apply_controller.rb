class ApplyController < ApplicationController

  def apply_leave
    if employee_signed_in?
    else
      redirect_to new_employee_session_path
    end
  end

  def update
    @employee = Employee.find(current_employee.id)
    @leave = @employee.leave
    current_name = params[:type_of_leave]
    if (Leave.column_names.include? current_name) and (@leave.instance_eval(current_name).to_i >= params[:days].to_i)
      @leave.update(status: "Pending")
      @leave.update(params.permit(:type_of_leave, :days, :from_date, :to_date))
      # result = @leave.instance_eval(current_name).to_i - params[:days].to_i
      # @leave.update_attributes(current_name.to_sym => result.to_s)
      flash[:notice] = "Leave applied! Wait for approval"
      redirect_to status_leave_status_path
    else
      flash[:alert] = "Leave not available"
      redirect_to apply_apply_leave_path
    end
  end


end
class LeavesController < ApplicationController

  def edit
    if admin_signed_in?
    @leave = Leave.find(params[:id])
  else
    redirect_to admin_session_path
  end
  end

  def update
    @leave = Leave.find(params[:id])
    if @leave.update(leave_params)
      flash[:notice] = "Employee details was updated successfully"
      if admin_signed_in?
        redirect_to home_path(@leave.employee.id)
      else
        redirect_to root_path
      end
    else
      render edit_leave_path
    end
  end

  private

  def leave_params
    params.require(:leave).permit(:sick, :privileged, :breavement, :study_leave, :time_off, :maternity, :paternity, :optional, :employee_id)
  end
end
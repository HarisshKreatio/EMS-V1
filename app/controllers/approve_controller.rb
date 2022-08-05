class ApproveController < ApplicationController

  def dashboard
    if admin_signed_in?
    @approvals = Leave.where(status: "Pending")
    else
      redirect_to admin_session_path
    end
  end

  def update
    @leave = Leave.find_by(employee_id: params[:employee_id])

    if params[:approval_status] == "Approved"
      current_type = @leave.type_of_leave
      result = @leave.instance_eval(current_type).to_i - @leave.days.to_i
      @leave.update(current_type.to_sym => result.to_s)
      @leave.update(status: "Approved")
      redirect_to approve_dashboard_path
    end

    if params[:approval_status] == "Denied"
      @leave.update(status: "Denied")
      redirect_to approve_dashboard_path
    end
  end

end
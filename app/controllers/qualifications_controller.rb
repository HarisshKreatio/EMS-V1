class QualificationsController < ApplicationController


  def edit
    if admin_signed_in? or employee_signed_in?
    @qualification = Qualification.find(params[:id])
  else
    redirect_to admin_session_path
  end
  end

  def update
    @qualification = Qualification.find(params[:id])
    if @qualification.update(qualification_params)
      flash[:notice] = "Employee details was updated successfully"
        if admin_signed_in?
        redirect_to home_path(@qualification.employee.id)
        else
          redirect_to root_path
        end
      else
          render edit_qualification_path
    end
  end

  private

  def qualification_params
    params.require(:qualification).permit(:designation, :experience, :pg_cgpa, :pg_year, :ug_cgpa, :ug_year,
                                          :diploma_cgpa, :diploma_year, :twelve_th_percent, :twelve_th_year,
                                          :ten_th_percent, :ten_th_year, :employee_id)
  end

end
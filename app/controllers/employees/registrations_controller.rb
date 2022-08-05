# frozen_string_literal: true

class Employees::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    @qualification = Qualification.new(qualification_params)
    @qualification.employee_id = resource.id
    @qualification.save

    @leave = Leave.new(leave_params)
    @leave.employee_id = resource.id
    @leave.save

    @salary = Salary.new(salary_params)
    @salary.employee_id = resource.id
    @salary.save
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  #protected

  # If you have extra params to permit, append them to the sanitizer.
  # if admin_signed_in?
  #   def update_resource(resource, params)
  #     resource.update_without_password(params)
  #   end
  # end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :dob, :phone_number, :gender, :martial_status, :blood_group, :fathers_name, :mothers_name, :address])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    # if admin_signed_in?
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :dob, :phone_number, :gender, :martial_status, :blood_group, :fathers_name, :mothers_name, :address], except: [:password,:password_confirmation,:current_password])
    # else
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :dob, :phone_number, :gender, :martial_status, :blood_group, :fathers_name, :mothers_name, :address, :password,:password_confirmation,:current_password])
    # end
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    flash[:notice] = "Employee added successfully."
    sign_out resource
    super(resource)
  end

  def qualification_params
    params.require(:employee).permit(:designation, :experience, :pg_cgpa, :pg_year, :ug_cgpa, :ug_year,
                                          :diploma_cgpa, :diploma_year, :twelve_th_percent, :twelve_th_year,
                                          :ten_th_percent, :ten_th_year, :employee_id)
  end

  def leave_params
    params.require(:employee).permit(:sick, :privileged, :breavement, :study_leave, :time_off, :maternity, :paternity, :optional, :employee_id)
  end

  def salary_params
    params.require(:employee).permit( :basic_pay, :hra, :statutory_bonus, :special_allowance, :employee_id)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

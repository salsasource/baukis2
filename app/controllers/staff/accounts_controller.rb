class Staff::AccountsController < Staff::Base
  def show
    @staff_member = current_staff_member
  end

  def edit
    @staff_member = current_staff_member
  end

  def update
    @staff_member = current_staff_member
    @staff_member.assign_attributes(staff_member_params)
    if @staff_member.save
      flash.notice = "アカウント情報が更新されました。"
      redirect_to :staff_account
    else
      render action: "edit"
    end
  end

  private def staff_member_params
    params.require(:staff_member).permit(
      :email, :family_name, :given_name,
      :family_name_kana, :given_name_kana,
    )
  end
end

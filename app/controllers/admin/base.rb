class Admin::Base < ApplicationController
  private def current_administrator
    if session[:staff_member_id]
      @current_administrator
        Administrator.find_by(id: session[:administrator_id])
    end
  end

  helper_method :current_administrator
end

class Admin::Base < ApplicationController
  before_action :authorize
  before_action :check_account
  before_action :check_timeout

  private def current_administrator
    if session[:administrator_id]
      @current_administrator ||=
        Administrator.find_by(id: session[:administrator_id])
    end
  end

  helper_method :current_administrator
  
  # アクセス制御
  private def authorize
    unless current_administrator
      flash.alert = "管理者としてログインしてください。"
      redirect_to :admin_login
    end
  end

  # 強制ログアウト
  private def check_account
    if current_administrator && !current_administrator.active?
      session.delete(:administrator_id)
      flash.alert = "アカウントが無効になりました。"
      redirect_to :admin_root
    end
  end

  # セッションタイムアウト
  TIMEOUT = 60.minutes

  private def check_timeout
    if current_administrator
      if session[:last_access_time] >= TIMEOUT.ago
        session[:last_access_time] = Time.current
      else
        session.delete(:administrator_id)
        flash.alert = "セッションがタイムアウトしました。"
        redirect_to :admin_login
      end
    end
  end
end

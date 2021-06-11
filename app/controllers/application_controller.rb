class ApplicationController < ActionController::Base
  # device利用の機能が使用される場合、:configure_permitted~が実行される
  before_action :configure_permitted_parameters,if: :devise_controller?

  # ログイン後マイページに以降
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  # ログアウト後トップページに以降
  def after_sign_out_path_for(resource)
    root_path
  end
  # 他のコントローラからも参照できる
  protected
  # signupの際に、nameのデータ操作が許可される
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end
end

class ApplicationController < ActionController::Base
    include SessionsHelper
    private
    # ログイン済みユーザーかどうか確認
     def redirect_if_has_not_logged_in
       unless logged_in?
         redirect_to user_login_url
       end
     end
end

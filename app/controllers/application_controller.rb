class ApplicationController < ActionController::Base
    include SessionsHelper
    private
    # ログイン済みユーザーかどうか確認
     def check_logged_in_user
       unless logged_in?
         redirect_to user_login_url
       end
     end
end

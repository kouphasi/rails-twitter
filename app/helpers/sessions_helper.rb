module SessionsHelper
    def log_in(user)
        session[:id] = user.id
    end
    def current_user
        if session[:id]
            @current_user ||= AccountTable.find(session[:id])
        end
    end
    def current_user?(user)
        user == current_user
    end
    def logged_in?
        !current_user.nil?
    end
    def log_out
        session.delete(:id)
        @current_user = nil
    end
end
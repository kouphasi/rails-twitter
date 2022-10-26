class SessionsController < ApplicationController
  def new
  end

  def create
    account=AccountTable.find_by(userId: params[:session][:userId].downcase)
    if account && account.authenticate(paramas[:session][:password])
      log_in account
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
# end
end

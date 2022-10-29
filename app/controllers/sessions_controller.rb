class SessionsController < ApplicationController
  def new
  end

  def create
    account=AccountTable.find_by(id: params[:session][:id])
    # puts account
    if account && account.authenticate(params[:session][:password_digest])
      log_in account
      redirect_to root_url
    else
      render "main"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
# end
end

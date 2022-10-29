class SessionsController < ApplicationController
  def new
  end

  def create
    account=AccountTable.find_by(id: params[:session][:id])
    # hash値エラーが出るのは登録するときに、password_digestに直接入れているから
    # passwordとして登録すれば、勝手にpassword_digestに入る
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

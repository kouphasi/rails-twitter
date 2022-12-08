class SessionsController < ApplicationController
  def new
  end
  
  def entry
  end

  def create
    account=User.find_by(name: params[:session][:name])
    # hash値エラーが出るのは登録するときに、password_digestに直接入れているから
    # passwordとして登録すれば、勝手にpassword_digestに入る
    if account && account.authenticate(params[:session][:password])
      log_in account
      redirect_to root_url
    else
      render "new"
    end
  end

  def setup
    puts "setup started"
    puts params
    @account = User.new(name:params[:session][:name], password:params[:session][:password])
    if @account.save
      redirect_to root_url
    else
      puts "cannot save"
      render "entry"
    end
    # redirect_to root_url
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
    end
  # end
end

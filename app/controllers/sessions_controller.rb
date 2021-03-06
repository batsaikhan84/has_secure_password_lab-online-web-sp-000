class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    if !@user.nil?
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    else
      redirect_to controller: 'sessions', action: 'new'
    end
  end
end

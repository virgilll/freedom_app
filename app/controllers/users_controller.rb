class UsersController < ApplicationController
  def dashboard
    @transaction = Transaction.where(user: current_user)
    # put everything u need for dashboard interfce here
  end
  def show
  end

end

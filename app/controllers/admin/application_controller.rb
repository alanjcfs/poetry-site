class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :user_must_be_admin

  private
  def poem_params
    params.require(:poem).permit(:title, :text, :johnson, :franklin)
  end

  def user_must_be_admin
    if current_user && !current_user.admin?
      redirect_to :root, notice: "You must be an admin"
    end
  end
end

class HomesController < ApplicationController

  before_filter :check_logged_in_user
  def show

  end

  private
  def check_logged_in_user
    if current_user
      redirect_to dashboard_path
    end
  end
end
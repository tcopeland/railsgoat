class WorkInfoController < ApplicationController
  def index
    @user = current_user
    if @user.blank? || @user.id != params[:user_id].to_i
      flash[:error] = "Apologies, looks like something went wrong"
      redirect_to home_dashboard_index_path
    end
  end

end

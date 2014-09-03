class AdminController < ApplicationController
  before_filter :administrative, :if => :admin_param, :except => [:get_user]
  skip_before_filter :has_info

  def dashboard
  end

...

    if params[:ip]
      @analytics = Analytics.hits_by_ip(params[:ip], fields)
    else
      @analytics = Analytics.all
    end
    render "layouts/admin/_analytics"
  end

  def get_all_users
    @users = User.all
    render :partial => "layouts/admin/get_all_users"
  end

  def get_user
    @user = User.find_by_id(params[:admin_id].to_s)
    arr = ["true", "false"]
    @admin_select = @user.admin ? arr : arr.reverse
    render :partial => "layouts/admin/get_user"
  end

...

  private

  def admin_param
    params[:admin_id] != '1'
  end
end

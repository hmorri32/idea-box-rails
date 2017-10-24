class Admin::BaseController < ApplicationController
  before_action :current_admin

  def current_admin
    render file: 'public/404.html', status: 404, layout: false unless current_user.admin?
  end
end
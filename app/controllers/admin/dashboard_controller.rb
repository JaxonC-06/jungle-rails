class Admin::DashboardController < ApplicationController
  before_action :authenticate

  def show
    @product_count = Product.count
    @product_categories = Category.count
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSCODE']
    end
  end
end

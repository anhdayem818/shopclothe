class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    #redirect_to root_url, :alert => 'Ban khong co quyen truy cap vao trang nay'
  	render :file => "#{Rails.root}/public/404.html", :status => 403, :layout => false
  end

  # => check_authorization
end

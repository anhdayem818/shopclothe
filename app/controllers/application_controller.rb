class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    #redirect_to root_url, :alert => 'Ban khong co quyen truy cap vao trang nay'
  	render :file => "#{Rails.root}/public/404.html", :status => 403, :layout => false
  end

  # => check_authorization
  
  private

	def namespace
	  # 2012.3.13 didn't work on Rails 3.0.7, cancan 1.6.7; looks promising, but needs some figuring out.
	  #cns = @controller.class.to_s.split('::')
	  #cns.size == 2 ? cns.shift.downcase : ""

	    # I am sure there is a slicker way to capture the controller namespace
	    # 2012.3.13 But it works!
	    controller_name_segments = params[:controller].split('/')
	    controller_name_segments.pop
	    controller_namespace = controller_name_segments.join('/').camelize
	end

	def current_ability
	  # Ability.new(current_user, namespace)
	  @current_ability ||= Ability.new(current_user, namespace)
	end
end

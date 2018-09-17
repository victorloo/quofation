class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  #view 呼叫controller方法 使用helper_method
  helper_method :current_cart

  private

  def current_cart
    @cart || set_cart # return @cart if @cart exits, or call set_cart
  end

  def set_cart
     if session[:cart_id]
      @cart = Cart.find_by(id: session[:cart_id])
    end
     @cart ||= Cart.create
     session[:cart_id] = @cart.id
    @cart
  end

  def after_sign_in_path_for(resource)
    if session[:new_order_data].present?
      @cart = Cart.find(session[:cart_id])
      cart_path(@cart)
    else
      super
    end
  end

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end


  protected
   
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name])
  end

end

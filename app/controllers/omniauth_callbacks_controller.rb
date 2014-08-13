class OmniauthCallbacksController < Devise::OmniauthCallbacksController   
  def google_oauth2    
    access_token = request.env["omniauth.auth"]
    session[:token] = access_token

    @user = User.find_for_google_oauth2(access_token, current_user)
 
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
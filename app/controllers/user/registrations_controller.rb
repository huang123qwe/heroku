class User::RegistrationsController < Devise::RegistrationsController
  def create
    super do 
      return redirect_to new_user_profile_path
    end
  end
end
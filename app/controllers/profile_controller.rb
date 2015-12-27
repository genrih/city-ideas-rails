class ProfileController < ApplicationController
  authorize_resource class: false

  def show
    @user = current_user
  end
end

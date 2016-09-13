class WelcomeController < ApplicationController
  def home
    if user_logged_in?
      redirect_to dilemmas_path
    end
  end
end

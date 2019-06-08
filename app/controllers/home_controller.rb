class HomeController < ApplicationController
  before_action :authenticate

  def index
    @user = current_user
    @parties = Party.all
  end
end

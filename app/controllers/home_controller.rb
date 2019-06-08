class HomeController < ApplicationController
  before_action :authenticate

  def index
    @user = current_user
    @parties = Party.where.not(id: current_user.members.first&.party_id)
  end
end

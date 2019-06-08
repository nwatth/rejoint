class PartiesController < ApplicationController
  before_action :authenticate

  def create
  end

  def update
    party = Party.find(params[:id])
    current_user.enter_party(party)
    redirect_to root_path
  end

  def destroy
    party = Party.find(params[:id])
    current_user.leave_party(party)
    redirect_to root_path
  end
end

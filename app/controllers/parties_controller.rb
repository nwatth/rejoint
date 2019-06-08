class PartiesController < ApplicationController
  before_action :authenticate

  def create
    party_name = params[:name].presence || "#{current_user.name}'s Party"
    current_user.create_party(party_name)
    redirect_to root_path
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

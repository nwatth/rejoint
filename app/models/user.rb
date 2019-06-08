class User < ApplicationRecord
  has_many :members

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.name = auth.info.name
      user.image_url = auth.info.image
    end
  end

  def has_party?
    members.present?
  end

  def create_party(party_name)
    party = Party.new(name: party_name)
    enter_party(party)
  end

  def enter_party(party)
    members.where(party: party).first_or_create! do |member|
      member.party = party
    end
  end

  def leave_party(party)
    members.where(party: party).first.destroy!
  end
end

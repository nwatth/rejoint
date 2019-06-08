class Member < ApplicationRecord
  belongs_to :user
  belongs_to :party

  after_destroy do |member|
    member.party.destroy! if member.party.members.empty?
  end
end

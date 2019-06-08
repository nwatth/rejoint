class Party < ApplicationRecord
  has_many :members

  LIMITED = 5.freeze
end

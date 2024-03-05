class Patient < ApplicationRecord
  has_one :user, as: :userable
  validates_presence_of :gender
  validates_presence_of :birth_date
  validates_presence_of :address
  validates_presence_of :city
end

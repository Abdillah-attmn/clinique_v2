class Doctor < ApplicationRecord
  has_one :user, as: :userable
  validates_presence_of :speciality
end

class Patient < ApplicationRecord
  GENDER = ['masculin', 'féminin']

  # Association
  has_one :user, as: :userable, dependent: :destroy
  accepts_nested_attributes_for :user

  # Validation
  validates :gender, inclusion: {in: GENDER}
  validates_presence_of :birth_date
  validates_presence_of :address
  validates_presence_of :zipcode
  validates_presence_of :city
end

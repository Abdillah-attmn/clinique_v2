class Doctor < ApplicationRecord
  SPECIALITY = ["cardiologie", "pediatrie", "neurologie", "endocrinologie"]
  has_one :user, as: :userable, dependent: :destroy
  accepts_nested_attributes_for :user

  # Validation
  validates_presence_of :speciality
end

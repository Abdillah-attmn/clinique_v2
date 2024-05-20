class Doctor < ApplicationRecord
  SPECIALITY = ["cardiologue", "pediatre", "neurologue", "endocrinologue", "ophtamologue", "ORL"]
  has_one :user, as: :userable, dependent: :destroy
  accepts_nested_attributes_for :user

  # Validation
  validates_presence_of :speciality, inclusion: {in: SPECIALITY}
end

class Doctor < ApplicationRecord
  SPECIALITY = ["cardiologue", "pediatre", "neurologue", "endocrinologue", "ophtamologue", "ORL"]
  has_one :user, as: :userable, dependent: :destroy
  accepts_nested_attributes_for :user

  # Recherche du docteur
  # include PgSearch::Model
  # pg_search_scope :global_search,
  #   against: [:speciality],
  #   associated_against: { user: %i[lastname]},
  #   using: { tsearch: {prefix: true} }

  # Validation
  validates_presence_of :speciality, inclusion: {in: SPECIALITY}
end

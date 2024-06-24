class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association Polymorphique
  belongs_to :userable, polymorphic: true

  # Validation
  validates_presence_of :firstname
  validates :lastname, presence: true, uniqueness: {scope: :firstname}
  validates :phone_number, presence: true, format: { with:  /(?:((?:\+|00)33)|0)\s*[1-9](?:[\s.-]*\d{2}){4}/}

  #Photo
  has_one_attached :photo
end

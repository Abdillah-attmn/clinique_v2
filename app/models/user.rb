class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association Polymorphique
  belongs_to :userable, polymorphic: true

  def doctor?
    "Doctor" == self.userable_type
  end

  def doctor
    Doctor.find(self.userable_id) if self.doctor?
  end

  def patient?
    "Patient" == self.userable_type
  end

  def patient
    Patient.find(self.userable_id) if self.patient?
  end

  # Validation
  validates_presence_of :firstname
  validates :lastname, presence: true, uniqueness: {scope: :firstname}
  validates :phone_number, presence: true, format: { with:  /\A(?: (?: \+ | 00 )33 | 0 ) \s*[1-9] (?:[\s.-]*\d{2}){4} \Z/}
end

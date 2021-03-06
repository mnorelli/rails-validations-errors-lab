class Owner < ActiveRecord::Base
  # TODO: add validations
  validates_presence_of :first_name, :last_name, :email
  validates :first_name, :last_name, :email, length: { maximum: 255 }
  validates :email, uniqueness: { case_sensitive: true }
  validates :phone, presence: true

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
      if phone.present?
        phone.gsub!(/^1|\(|\)|\.|-|,/,"")
      end
  end

end

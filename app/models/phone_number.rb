class PhoneNumber < ActiveRecord::Base
  belongs_to :contact
  validates :number, :phone_type, presence: true
  PHONE_TYPE = ["Home", "Work", "Cell"]
end

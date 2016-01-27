class PhoneNumber < ActiveRecord::Base
  belongs_to :contact
  validates :number, length: { minimum: 10, maximum: 10}, numericality: true, unless: "number.blank?"

  PHONE_TYPE = ["Home", "Work", "Cell"]
end

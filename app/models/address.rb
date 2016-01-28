class Address < ActiveRecord::Base
  belongs_to :contact
  validates :zip, length: { minimum: 5, maximum: 9 }, numericality: true, unless: "zip.blank?"
  ADDRESS_TYPE = ["Home", "Work", "Vacation"]
end

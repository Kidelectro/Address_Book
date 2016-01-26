class Contact < ActiveRecord::Base
  has_many :phone_numbers
  accepts_nested_attributes_for :phone_numbers
  validates :first_name, :last_name, :birthday, presence: true
end

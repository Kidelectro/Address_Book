class Contact < ActiveRecord::Base
  validates :first_name, :last_name, :birthday, presence: true
end

class Contact < ActiveRecord::Base
  has_many :phone_numbers
  has_many :addresses
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true, reject_if: :number_blank
  accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: :address_blank
  validates :first_name, :last_name, :birthday, presence: true

  def number_blank(params)
    params[:number].blank?
  end

  def address_blank(params)
    params[:street].blank?
  end
end

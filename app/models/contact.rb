class Contact < ActiveRecord::Base
  has_many :phone_numbers
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true, reject_if: :number_blank
  validates :first_name, :last_name, :birthday, presence: true

  def number_blank(params)
    params[:number].blank?
  end
end

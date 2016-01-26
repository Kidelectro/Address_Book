class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @phonenumber = PhoneNumber.new
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @phonenumber = @contact.phone_numbers.create(phonenumber_params)
    redirect_to contact_path(@contact)
  end

  def update

  end

  def edit
  end

  def show
  end

  def destroy

  end

  private

  def phone_number_params
    params.require(:phone_number).permit(:number,
                                        :phone_type,
                                        :contact_id)
  end

  def set_phone_number
    @phonenumber = PhoneNumber.find(params[:contact_id])
  end
end

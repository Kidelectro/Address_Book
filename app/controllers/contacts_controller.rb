class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact, notice: "Contact was saved!"
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: "Contact updated!"
    else
      render :edit
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name,
                                    :last_name,
                                    :birthday)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end

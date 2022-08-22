class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show update destroy]

  def index
    @contacts = Contact.all

    render json: @contacts
  end

  def show
    render json: @contact, include: %i[kind], meta: { author: 'André Filipe F. Borba' }
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @contact.destroy && @contact.phones.destroy_all
      render json: @contact, status: :ok, message: 'Contact deleted'
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name,
                                    :email,
                                    :birthdate,
                                    :kind_id,
                                    phones_attributes: %i[id number _destroy],
                                    address_attributes: %i[street city])
  end
end

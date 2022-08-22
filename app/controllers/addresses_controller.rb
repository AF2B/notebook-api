class AddressesController < ApplicationController
  before_action :set_address, only: %i[show]
  before_action :set_contact, only: %i[update]

  def update
    if @contact.address.update(address_params)
      render json: @contact.address, status: :ok, message: 'Address updated'
    else
      render json: @contact.address.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @address
  end

  private

  def set_address
    if params[:contact_id]
      @address = Contact.find(params[:contact_id]).address
      return @address
    end

    @address = Address.find(params[:id])
  end

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def address_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end

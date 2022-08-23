class AddressesController < ApplicationController
  before_action :set_contact
  # before_action :set_contact, only: %i[update]

  def create
    @contact.address = Address.new(address_params)

    if @contact.save
      render json: @contact.address, status: :created, message: 'Address created',
             location: contact_address_url(@contact)
    else
      render json: @contact.address.errors, status: :unprocessable_entity
    end
  end

  # FIX ME: That not updating address, just returning it
  def update
    if @contact.address.update(address_params)
      render json: @contact.address, status: :ok, message: 'Address updated'
    else
      render json: @contact.address.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @contact.address
  end

  # FIX ME, Problem with params
  def destroy
    if @contact.address.destroy
      render json: @contact.address, status: :ok, message: 'Address deleted', location: contact_address_url(@contact)
    else
      render json: @contact.address.errors, status: :unprocessable_entity
    end
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

  # FIX ME, That doest deserialize correctly for some reason...
  def address_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end

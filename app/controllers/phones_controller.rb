class PhonesController < ApplicationController
  before_action :set_contact

  def create
    @contact.phones << Phone.new(phone_params)

    if @contact.save
      render json: @contact.phones, status: :created, message: 'Phone created',
             location: contact_phones_url(@contact)
    else
      render json: @contact.phones.errors, status: :unprocessable_entity
    end
  end

  # FIX ME, Could not find a phone without an id
  def update
    puts "params: #{params}"
    phone = Phone.find(params[:id])

    if phone.update(phone_params)
      render json: @contact.phones, status: :ok, message: 'Phone updated'
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @contact.phones
  end

  def destroy
    phone = Phone.find(params[:id])

    if phone.destroy
      render json: @contact.phones, status: :ok, message: 'Phone deleted',
             location: contact_phones_url(@contact)
    else
      render json: @contact.phones.errors, status: :unprocessable_entity
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def phone_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end

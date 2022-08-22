class AddressesController < ApplicationController
  before_action :set_address, only: %i[show]

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
end

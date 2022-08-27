require 'rails_helper'

describe V1::ContactsController, type: :controller do
  context 'GET #index' do
    it 'returns a success and status code 200' do
      request.headers['Accept'] = 'application/vnd.api+json'
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'should return a not_acceptable and status code 406' do
      request.headers['Accept'] = 'text/html'
      get :index
      expect(response).to have_http_status(:not_acceptable)
    end

    context 'GET #show' do
      it 'returns a success and status code 200' do
        request.headers['Accept'] = 'application/vnd.api+json'
        contact = Contact.first
        get :show, params: { id: contact.id }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data').fetch('id')).to eq(contact.id.to_s)
        expect(response).to have_http_status(:success)
      end

      it 'should return a not_acceptable and status code 406' do
        request.headers['Accept'] = 'text/html'
        get :show, params: { id: 1 }
        expect(response).to have_http_status(:not_acceptable)
      end

      it 'should return a not_found and status code 404' do
      end

      it 'should return a type equals to contacts and status code 200' do
        request.headers['Accept'] = 'application/vnd.api+json'
        contact = Contact.first
        get :show, params: { id: contact.id }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data').fetch('type')).to eq('contacts')
        expect(response).to have_http_status(:success)
      end
    end
  end
end

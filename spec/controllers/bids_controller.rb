require 'rails_helper'

RSpec.describe BidsController, type: :controller do
    before do 
        bid = Bid.create(country: 'en', category: 'finance', channel: 'ca', amount: 1.0)
    end

    it 'should return list of bids' do 
        get :index, params: {countries: 'en'}
        expect(response).to have_http_status(:ok)
        json = JSON.parse(response.body)
        expect(json['bids'].count).to eq(1)
    end

    it 'should return no bids if filters not matched' do 
        get :index, params: {countries: 'en', categories: 'sport'}
        json = JSON.parse(response.body)
        expect(json['bids'].count).to eq(0)
    end

    after do 
        Bid.all.map(&:destroy)
    end
  end
  
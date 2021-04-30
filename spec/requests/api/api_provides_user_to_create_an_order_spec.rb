RSpec.describe 'POST /api/orders', type: :request do
  describe 'Succesfully' do 
    let(:menu_item) { create(:menu_item)}
    let(:user) { create(:user)}
    let(:auth_headers) { user.create_new_auth_token}
    before do
      post '/api/orders', 
        params: { 
          menu_item_id: menu_item.id},
        headers: auth_headers
    end
    
    it 'is expected to return a 201 status' do 
      expect(response_json).to have_http_status 201
    end

    it 'is expected to return a success message' do
      expect(response_json['message']).to eq 'This item was added to your order!'
    end

    it 'is expected to return an array of items' do
      expect(response_json['order']['title'].count).to eq 1
    end

    it 'is expected to return the name of the product in the order' do
    expect(response_json['order']['title'].first['name']).to eq 'kebab'
    end


  end
end
require 'omniauth/strategies/dex_energy'

RSpec.describe OmniAuth::Strategies::DexEnergy do
  describe '$logout_uri' do
    let(:client_id) { 'abc-def' }
    let(:redirect_uri) { 'https://example.com/hello?logged_out=true&refresh=no' }

    it 'returns the appropriate URL' do
      expected_logout_uri = 'https://who.dex.energy/oauth/logout?client_id=abc-def&redirect_uri=https%3A%2F%2Fexample.com%2Fhello%3Flogged_out%3Dtrue%26refresh%3Dno'
      expect(described_class.logout_uri(client_id: client_id, redirect_uri: redirect_uri)).to eq(expected_logout_uri)
    end
  end
end

# frozen_string_literal: true

describe Yolt do
  describe '.configure' do
    subject(:configure) { Yolt.configure { |config| config.client_id = 'client-id' } }

    it 'globally configures Yolt clients' do
      expect { configure }.to change { Yolt.configuration.client_id }.from(nil).to('client-id')
    end
  end

  describe '.client' do
    subject(:client) { Yolt.client }

    it 'creates a new Client with a copy of the global configuration' do
      expect(client).to be_a(Yolt::Client)
      expect(client.configuration).to eq(Yolt.configuration)
      expect(client.configuration.object_id).to_not eq(Yolt.configuration.object_id)
    end
  end
end

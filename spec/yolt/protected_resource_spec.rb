# frozen_string_literal: true

describe Yolt::ProtectedResource, :configured do
  let(:resource) { Yolt::ProtectedResource.new(client, '/resource') }
  let(:client) { Yolt.client }

  describe '#perform_request' do
    context 'given a block that raises no error' do
      let(:perform_request) { resource.perform_request { 'success' } }

      it 'succeeds' do
        expect(perform_request).to eq('success')
      end
    end

    context 'given a block that raised an error' do
      let(:perform_request) { resource.perform_request { fail(error) } }

      context 'and not 401 Unauthorized' do
        let(:error) { Yolt::Error::NotFound.new('Not found', 404) }

        it 're-raises the error' do
          expect { perform_request }.to raise_error(error)
        end
      end

      context 'and 401 Unauthorized' do
        let(:error) { Yolt::Error::Unauthorized.new('Unauthorized', 401, error_code) }

        context 'and not error code CP012' do
          let(:error_code) { 'CP001' }

          it 're-raises the error' do
            expect { perform_request }.to raise_error(error)
          end
        end

        context 'and error code CP012 (access token expired)' do
          let(:perform_request) do
            resource.perform_request do
              @attempt ||= 0
              @attempt += 1
              fail(error) if @attempt == 1

              'success'
            end
          end
          let(:error_code) { Yolt::ErrorCode::ACCESS_TOKEN_EXPIRED }

          it 'retries and succeeds' do
            expect(perform_request).to eq('success')
          end
        end
      end
    end
  end
end

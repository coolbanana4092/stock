RSpec.shared_context "event setup" do
  let(:event) { FactoryBot.create(:event) }
end

RSpec.configure do |config|
  config.include_context 'event setup'
end

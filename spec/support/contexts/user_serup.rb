RSpec.shared_context "user setup" do
  let(:user) { FactoryBot.create(:user) }
end

RSpec.configure do |config|
  config.include_context 'user setup'
end

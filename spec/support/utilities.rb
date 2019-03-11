module Utilities
  def sign_in_as(user)
    post login_path, params: { session: { email: user.email, password: user.password } }
  end
end

RSpec.configure do |config|
  config.include Utilities
end

FactoryBot.define do
  factory :user do
    name  "m-fukaya"
    sequence(:email) { |n| "m-fukaya#{n}@gmail.com" }
    password "ou79dvea2"
  end
end

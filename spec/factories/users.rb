FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    # encrypted_password "$2a$11$G5KIoqmYr13v5.35oEioguiorqnDjPIiE6f3a7rzPWRqNq5hZJy1C"
    # sign_in_count 1
    name       { Faker::Name.name }
    password "00000000"
    password_confirmation "00000000"
    # created_at { Faker::Time.between(2.days.ago, Time.now, :all)}
    # updated_at { Faker::Time.between(2.days.ago, Time.now, :all)}
  end
end

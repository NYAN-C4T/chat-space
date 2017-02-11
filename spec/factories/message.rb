FactoryGirl.define do

  factory :message do
    body       { Faker::Lorem.word }
    image      { Faker::Internet.url }
    user_id    1
    group_id   1
    created_at { Faker::Time.between(2.days.ago, Time.now, :all)}
    updated_at { Faker::Time.between(2.days.ago, Time.now, :all)}
  end

end


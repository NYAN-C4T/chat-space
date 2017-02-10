FactoryGirl.define do

  factory :message do
    body       "bar"
    image      "baz"
    user_id    1
    group_id   1
    created_at "2017-02-07 12:51:11"
    updated_at "2017-02-07 12:51:11"
  end

end
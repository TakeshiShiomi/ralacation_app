FactoryBot.define do
  factory :photo do
    user_id { FactoryBot.create(:user).id }
  end
end

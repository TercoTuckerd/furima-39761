FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.email}
    password              {"abc123"}
    password_confirmation {"abc123"}
    first_name            {"あ"}
    family_name           {"あ"}
    first_name_kana       {"ア"}
    family_name_kana      {"ア"}
    birth_day             {"1930-1-1"}
  end
end
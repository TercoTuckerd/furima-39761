FactoryBot.define do
  factory :item do
    item_name   {"パソコン"}
    explanation {Faker::Lorem.sentence}
    category_id {2}
    condition_id{2}
    charge_id   {2}
    area_id     {2}
    wait_id     {2}
    price       {5000}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

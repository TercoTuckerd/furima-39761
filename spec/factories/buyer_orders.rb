FactoryBot.define do
  factory :buyer_order do
    post_code {'123-1234'}
    area_id {2}
    city { '横浜市緑区' }
    address { '3-4' }
    building { '青山ビル' }
    phone { '09012341234' }
    token {"tok_abcdefghijk00000000000000000"}

    association :user_id
    association :item_id
  end
end

require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  describe '商品購入記録の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buyer_order = FactoryBot.build(:buyer_order,user_id: @user.id, item_id: @item.id)
      sleep(0.1)
   end

   context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@buyer_order).to be_valid
      end
      it '建物名が空でも購入できること' do
        @buyer_order.building = ''
        expect(@buyer_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeは空では保存できないこと' do
        @buyer_order.post_code = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
        @buyer_order.post_code = '123-123４'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'area_idが「---」が選択されている場合は購入できないこと' do
        @buyer_order.area_id = '1'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空だと購入できないこと' do
        @buyer_order.city = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できないこと' do
        @buyer_order.address = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと購入できないこと' do
        @buyer_order.phone = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが9桁以下だと購入できないこと' do
        @buyer_order.phone = '090123456'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Phone is invalid. Input only number")
      end
      it 'phoneが12桁以上だと購入できない' do
        @buyer_order.phone = '090123456789'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Phone is invalid. Input only number")
      end
      it 'phoneが半角数値でないと購入できないこと' do
        @buyer_order.phone = '090123456７'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Phone is invalid. Input only number")
      end
      it 'tokenが空では購入できないこと' do
        @buyer_order.token = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @buyer_order.user_id = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @buyer_order.item_id = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

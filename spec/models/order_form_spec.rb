require 'rails_helper'
RSpec.describe OrderForm, type: :model do
  before do
    # 出品者
    @seller = FactoryBot.create(:user)
    # 誰購入者を生成
    @buyer = FactoryBot.create(:user)
    # どの商品を生成
    @item = FactoryBot.create(:item, user_id: @seller.id)
    # 購入するのに必要なデータを生成
    @order_form = FactoryBot.build(:order_form, user_id: @buyer.id, item_id: @item.id)
    sleep(3)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいく時' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_form).to be_valid
      end
    end
  end

  context '商品購入がうまくいかない時' do
    it 'tokenが空では購入できないこと' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end

    it 'postnumberが空では購入できないこと' do
      @order_form.postnumber = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postnumber can't be blank")
    end

    it 'prifecture_idが_ _だと購入できないこと' do
      @order_form.prifecture_id = '0'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prifecture can't be blank")
    end

    it 'cityが空では購入できないこと' do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end

    it 'housenumberが空では購入できないこと' do
      @order_form.housenumber = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Housenumber can't be blank")
    end

    it 'housenameが空でも購入できる' do
      @order_form.housename = nil
      @order_form.valid?
      expect(@order_form).to be_valid
    end

    it 'phonenumberが空では購入できないこと' do
      @order_form.phonenumber = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phonenumber can't be blank")
    end

    it 'postnumberが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
      @order_form.postnumber = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Postnumber is invalid. Include hyphen(-)')
    end

    it 'phonenumberが11桁以上では購入できないこと' do
      @order_form.phonenumber = '123456789012'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phonenumber is invalid')
    end
  end
end

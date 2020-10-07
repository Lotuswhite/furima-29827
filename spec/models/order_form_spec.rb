require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入機能' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@order_form).to be_valid
    end
  end

  it "tokenが空では購入できないこと" do
    @order_form.token = nil
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Token can't be blank")
  end

  it "postnumberが空では購入できないこと" do
    @order_form.postnumber = nil
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Postnumber can't be blank")
  end

  it 'prifecture_idが_ _だと購入できないこと' do
    @order_form.prifecture_id = '0'
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include('Prifecture must be other than 0')
  end

  it "cityが空では購入できないこと" do
    @order_form.city = nil
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("City can't be blank")
  end

  it "housenumberが空では購入できないこと" do
    @order_form.housenumber = nil
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Housenumber can't be blank")
  end

  it "housenameが空では購入できないこと" do
    @order_form.housename = nil
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Housename can't be blank")
  end

  it "phonenumberが空では購入できないこと" do
    @order_form.phonenumber = nil
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Phonenumber can't be blank")
  end

  it 'postnumberが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
    @order_form.postnumber = '1234567'
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Postnumber is invalid. Include hyphen(-)")
  end

  it "phonenumberが11桁以内では購入できないこと" do
    @order_form.phonenumber = '123456789012'
    @order_form.valid?
    binding.pry
    expect(@order_form.errors.full_messages).to include("Phonenumber can't be blank")
  end


end

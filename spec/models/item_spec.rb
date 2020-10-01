require 'rails_helper'

describe User do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品が上手くいく時' do
      it 'image,name,indfo,category_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品機能が上手くいかない時' do
      it 'imageが空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では出品できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoが空では出品できないこと' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'category_idが_ _だと出品できないこと' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end

      it 'status_idが_ _だと出品できないこと' do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end

      it 'shopping_status_idが_ _ だと出品できないこと' do
        @item.shopping_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping status must be other than 0')
      end

      it 'prifecture_idが_ _だと出品できないこと' do
        @item.prifecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prifecture must be other than 0')
      end

      it 'scheduled_idが_ _だと出品できないこと' do
        @item.scheduled_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled must be other than 0')
      end

      it 'priceが空では出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数字でないと出品できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end

      it '価格の範囲が、¥300~¥9,999,999の間でないと出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
    end
  end
end

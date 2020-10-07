class OrderForm
  include ActiveModel::Model
  
    attr_accessor :user_id, :item_id,:token, :postnumber, :prifecture_id, :city, :housenumber, :housename, :phonenumber
    validates :token, presence: true
    validates :postnumber, :prifecture_id, :city, :housenumber, :housename, :phonenumber, presence: true
  
    validates :postnumber, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phonenumber, format: {with: /\A\d{11}\z/}
    validates :prifecture_id, numericality: { other_than: 0, message: "can't be blank" }
  
    def save
      # オーダーの情報を保存し、「order」という変数に入れている
      order = Order.create(user_id: user_id, item_id: item_id)
      # 住所の情報を保存
      Address.create(postnumber: postnumber, prifecture_id: prifecture_id, city: city, housenumber: housenumber, housename: housename, phonenumber: phonenumber, order_id: order.id)
        
    end
end


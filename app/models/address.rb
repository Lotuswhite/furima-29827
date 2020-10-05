class Address < ApplicationRecord
  #Association

 belongs_to :order dependent: :destroy

end

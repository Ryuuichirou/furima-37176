class DeliveryDay < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１〜２日で発送' },
    { id: 3, name: '２〜３日で発送' },
    { id: 4, name: '４〜７日で発送' }
  ]
  has_many :items
end

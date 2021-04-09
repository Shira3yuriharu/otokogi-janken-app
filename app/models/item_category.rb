class ItemCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '食べ物' },
    { id: 3, name: '飲み物' },
    { id: 4, name: 'お土産' },
    { id: 5, name: '宿泊費' },
    { id: 6, name: '交通費' },
    { id: 7, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :results
end
class User < ApplicationRecord
  has_one :articles

  has_many :children,
  -> (user) { unscope(:where).where("father_id = :id OR mother_id = :id", id: user.id) },
   class_name: "User"

   has_many :grandchildren,
  -> (user) { unscope(:where).where("father_id IN (:ids) OR mother_id IN (:ids)", ids: user.children.ids) },
  class_name: "User"

  belongs_to :mother, class_name: "User", optional: true
  belongs_to :father, class_name: "User", optional: true
  has_one :grandfather, through: :father, source: :father
  has_one :grandmother, through: :father, source: :mother
end

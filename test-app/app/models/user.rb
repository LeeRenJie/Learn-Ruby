class User < ApplicationRecord
  has_one :article
  has_many :children, class_name: "User", foreign_key: "parent_id"
  belongs_to :parent, class_name: "User", optional: true
  has_many :grandchildren, through: :children, source: :children
end

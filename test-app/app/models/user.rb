class User < ApplicationRecord
  has_one :article
  has_many :children, class_name: "User", foreign_key: "parent_id"
  has_many :grandchildren, through: :children, source: :children
end

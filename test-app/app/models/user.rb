class User < ApplicationRecord
  has_one :article
  belongs_to :mother, class_name: "User", optional: true
  belongs_to :father, class_name: "User", optional: true
  has_one :grandfather, through: :father, source: :father
  has_one :grandmother, through: :father, source: :mother
end

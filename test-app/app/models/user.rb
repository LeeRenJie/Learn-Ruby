class User < ApplicationRecord
  has_one :articles

  has_many :children,
  -> (user) { unscope(:where).where("father_id = :id OR mother_id = :id", id: user.id) },
   class_name: "User"

  def grandchildren
    user_id = self.id

    User.where(
      "father_id IN (:ids) OR mother_id IN (:ids)",
      ids: User.where("father_id = :id OR mother_id = :id", id: user_id).pluck(:id)
    )
  end

  belongs_to :mother, class_name: "User", optional: true
  belongs_to :father, class_name: "User", optional: true
  has_one :grandfather, through: :father, source: :father
  has_one :grandmother, through: :father, source: :mother
end

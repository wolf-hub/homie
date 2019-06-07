class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recepient, foreign_key: :recepient_id, class_name: "User"

  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, :recepient_id

  scope :involving, -> (user) {
    where("conversations.sender_id = ? OR conversations.recepient_id = ?", user.id, user.id)
  }

  scope :between, -> (user_A, user_B) {
    where("(conversations.sender_id = ? OR conversations.recepient_id = ?) OR conversations.sender_id = ? OR conversations.recepient_id = ?", user_A, user_B, user_B, user_A)
  }
end

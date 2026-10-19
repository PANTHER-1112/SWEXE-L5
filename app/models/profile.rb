class Profile < ApplicationRecord
  belongs_to :user

  validates :message, presence: { message: "を入力してください"}
end

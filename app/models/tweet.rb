class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :like_users, through: :likes, source: :user
    validates :message, presence: true

    def like(user)
        likes.find_or_create_by!(user_id: user.id)
    end

    def unlike(user)
        likes.find_by(user_id: user.id)&.destroy
    end

    def liked?(user)
        user.present? && likes.exists?(user_id: user.id)
    end
end

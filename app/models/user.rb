class User < ApplicationRecord
    has_secure_password
    has_many :convos_a, class_name: "Conversation", foreign_key: "user_a_id"
    has_many :user_bs, through: :convos_a, source: :user_b

    has_many :convos_b, class_name: "Conversation", foreign_key: "user_b_id"
    has_many :user_as, through: :convos_b, source: :user_a

    has_many :messages

    has_many :friendships
    has_many :friends, through: :friendships

    has_many :requests_sent, ->{ where(status: false) }, class_name: 'Friendship'
    has_many :friend_requests, through: :requests_sent, source: :friend

    has_many :requests_accepted, -> { where(status: true) }, class_name: 'Friendship'
    has_many :accepted_requests, through: :requests_accepted, source: :friend

    has_many :received_accepted_requests, -> { where status: true }, class_name: 'Friendship', foreign_key: 'friend_id'
    has_many :received_requests, through: :received_accepted_requests, source: :user

    has_many :received_pending_requests, -> { where status: false }, class_name: 'Friendship', foreign_key: 'friend_id'
    has_many :pending_requests, through: :received_pending_requests, source: :user

    validates :username, presence: true, uniqueness: true


    def self.all_except(user)
        where.not(id: user)
    end

    def get_conversations
        conversations = []

        self.convos_a.each do |convo|
            info = {
                convo: convo,
                user_a_username: User.find(convo.user_a_id).username,
                user_b_username: User.find(convo.user_b_id).username,
                unread_messages: convo.messages.where(read: false)
            }
            conversations << info
        end
        
        self.convos_b.each do |convo|
            info = {
                convo: convo,
                user_a_username: User.find(convo.user_a_id).username,
                user_b_username: User.find(convo.user_b_id).username,
                unread_messages: convo.messages.where(read: false)

            }
            conversations << info
        end

        conversations
    end



end

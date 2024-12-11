class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :messages, dependent: :destroy
  has_many :conversations, foreign_key: :sender_id, class_name: 'Conversation', dependent: :destroy
  has_many :received_conversations, class_name: 'Conversation', foreign_key: :recipient_id

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

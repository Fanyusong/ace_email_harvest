class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :email_campaigns
  has_many :history_search_emails
  has_many :messages, class_name: "Ahoy::Message"

  %w(first_name last_name).each do |i|
    validates_presence_of i
  end
end

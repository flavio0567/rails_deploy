class Group < ActiveRecord::Base
  belongs_to :user

  has_many :joins, dependent: :destroy
  has_many :users, through: :joins

  validates :name, :description, presence: true
  validates :name, length: { minimum: 5 }
  validates :description, length: { minimum: 10 }

end

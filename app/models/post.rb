class Post < ApplicationRecord
  
  validates :user_id, presence: true
  validates :title,   presence: true,
                      length: { minimum: 5 }
  validates :body,    presence: true,
                      length: { minimum: 5 }
  
  attr_accessor :user_id
  
  def author
    User.find_by(user_id).name
  end
  
end

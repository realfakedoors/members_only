class Post < ApplicationRecord
  
  attr_accessor :user_id
  
  def author
    User.find_by(user_id).name
  end
  
end

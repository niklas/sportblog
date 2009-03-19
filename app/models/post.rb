class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :body
  validates_length_of :body, :in => 6..100
end

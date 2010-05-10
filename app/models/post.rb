class Post < ActiveRecord::Base
  attr_accessible :name, :content, :post_date
  acts_as_textiled :content
end

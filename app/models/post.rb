class Post < ActiveRecord::Base
  attr_accessible :name, :content, :post_date
end

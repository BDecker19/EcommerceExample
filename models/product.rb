class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :line_items
  has_many :orders, :through  => :line_items
end

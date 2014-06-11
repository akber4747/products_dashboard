class Product < ActiveRecord::Base
	belongs_to :category
	has_many :comments
	validates :name, :description, :pricing, :category_id,  presence: true

end

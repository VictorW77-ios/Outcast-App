class Post < ActiveRecord::Base
    belongs_to :user

    # activerecord validators 
    validates :title, :image_url, :description, presence: true
end

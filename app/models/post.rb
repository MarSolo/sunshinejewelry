class Post < ActiveRecord::Base
	belongs_to :user

	validates :title, presence: true

    validates :text, presence: true

    has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" }

    validates :image, presence: false
end

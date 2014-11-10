class Post < ActiveRecord::Base

	belongs_to :user

	validates :title, presence: true

    validates :text, presence: true

    has_attached_file :image, :default_url => "/images/sunshine_logo.jpg",
    	:styles => { :medium => "500x500>", :thumb => "100x100>" }

    validates :image, presence: false

    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end

class Post < ActiveRecord::Base
	belongs_to :user

	validates :title, presence: true,
                    length: { minimum: 5 }

    validates :text, presence: true

    has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" }

    validates :image, presence: true

    validates_attachment :image, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end

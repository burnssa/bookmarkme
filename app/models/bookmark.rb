class Bookmark < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
	has_many :likes, dependent: :destroy
    # has_attached_file :thumbnail, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  default_scope { order('updated_at DESC') }
  after_create :set_thumbnail_url

	def embedly_api
		#Rails.logger.info ">>>>>>>>>> Embedly key: #{ENV['EMBEDLY_API']}"
		embedly_api = Embedly::API.new :key => ENV['EMBEDLY_API'], :user_agent => 'Chrome/37.0 (compatible; bookmarkme/1.0; burnssa@gmail.com)'
	end


  def set_thumbnail_url
    obj = embedly_api.oembed :url => self.url

    self.update_attribute(:thumbnail_url, obj[0].thumbnail_url) if obj[0] && obj[0].thumbnail_url.present?
  end

end

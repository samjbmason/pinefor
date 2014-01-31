class Gift < ActiveRecord::Base
  belongs_to :list, dependent: :destroy, counter_cache: true
  belongs_to :user

  validates :name, presence: true
  validates :link, presence: true

  before_save :add_link_protocol


  # This is a helper that adds http:// to link if one doesnt exist
  def add_link_protocol
    unless self.link[/\Ahttp:\/\//] || self.link[/\Ahttps:\/\//] || self.link.blank?
      self.link = "http://#{self.link}"
    end
  end

  # Method to get urls domain only
  def get_domain
    if self.link.present?
      uri = URI.parse(self.link)
      uri.host
    end
  end
end

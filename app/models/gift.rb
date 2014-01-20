class Gift < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  validates :name, presence: true
  validates :price, numericality: true, allow_nil: true
  before_save :add_link_protocol

  private

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

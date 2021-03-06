class Gift < ActiveRecord::Base
  belongs_to :list, counter_cache: true, touch: true
  belongs_to :user

  validates :name, presence: true
  validates :link, presence: true

  before_save :add_link_protocol
  after_destroy :send_deleted_notification


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

  # Send delete notification to user
  def send_deleted_notification
    GiftMailer.deleted_notification(self).deliver if self.user.present?
  end
end

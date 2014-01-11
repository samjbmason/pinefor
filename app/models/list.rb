class List < ActiveRecord::Base
  belongs_to :user
  has_many :gifts, dependent: :destroy

  validates :name, presence: true

  before_save :create_unique_url

  def create_unique_url
    begin
    self.url = SecureRandom.urlsafe_base64(8)
    end while self.class.exists?(url: url)
  end

  def natural_due_date
    due_date.strftime('%d/%m/%Y') if due_date
  end

  def natural_due_date=(date)
    self.due_date = Chronic.parse(date) if date.present?
  end
end

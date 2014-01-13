class List < ActiveRecord::Base
  belongs_to :user
  has_many :gifts, dependent: :destroy

  validates :name, presence: true

  before_save :create_unique_url

  private

  # This creates a unique string then checks if it exists if it does it runs loop again until unique is found
  def create_unique_url
    begin
    self.url = SecureRandom.urlsafe_base64(10)
    end while self.class.exists?(url: url)
  end

  # Getter for easy way to get nice date
  def natural_due_date
    due_date.strftime('%d/%m/%Y') if due_date
  end

  # Setter to convert nice date to db save-able date format
  def natural_due_date=(date)
    self.due_date = Chronic.parse(date) if date.present?
  end
end

class List < ActiveRecord::Base
  belongs_to :user
  has_many :gifts, dependent: :destroy

  validates :name, presence: true

  before_save :create_unique_public_hash

  # This creates a unique string then checks if it exists if it does it runs loop again until unique is found
  def create_unique_public_hash
    begin
    self.public_hash = SecureRandom.urlsafe_base64(10)
    end while self.class.exists?(public_hash: public_hash)
  end

  # Getter for date (needed for best in place)
  def human_due_date
    due_date
  end

  # Setter to convert nice date to db save-able date format
  def human_due_date=(date)
    self.due_date = Chronic.parse(date) if date.present?
  end

  # Formats the human due_date into a format of my choosing
  def nice_date_format
    self.human_due_date.strftime('%d/%m/%Y')
  end


  def to_param
    "#{id}-#{name.parameterize}"
  end
end

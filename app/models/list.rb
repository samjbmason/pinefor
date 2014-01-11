class List < ActiveRecord::Base
  belongs_to :user
  has_many :gifts

  validates :name, presence: true

  def natural_due_date
    due_date.strftime('%d/%m/%Y') if due_date
  end

  def natural_due_date=(date)
    self.due_date = Chronic.parse(date) if date.present?
  end
end

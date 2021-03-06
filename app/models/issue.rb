class Issue < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  validates :issue_name, presence: true,
            :length => {:maximum => 34}

  validates :issue_type, presence: true

  validates :description, presence: true

end

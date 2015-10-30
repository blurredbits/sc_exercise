class Company < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :admin, class_name: "User"
end

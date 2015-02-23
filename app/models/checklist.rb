class Checklist < ActiveRecord::Base
  scoped_to_account

  validates :name,
          :presence => true

  has_many :tasks

  accepts_nested_attributes_for :tasks, :allow_destroy => true
end

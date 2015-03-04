class Checklist < ActiveRecord::Base
  validates :name,
          :presence => true

  has_many :tasks, dependent: :destroy, as: :checkable
  belongs_to :recipe

  accepts_nested_attributes_for :tasks, :allow_destroy => true

  resourcify
end

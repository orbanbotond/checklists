class Task < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :checkable, polymorphic: true

  validates :description,
      presence: true

  scope :pending, -> { where(value: false) }
end

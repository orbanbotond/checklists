class Task < ActiveRecord::Base
  belongs_to :checkable, polymorphic: true

  validates :description,
            presence: true

  scope :pending, -> { where(value: false) }

  update_index('search#recipe') { checkable if checkable_type == 'Recipe' }
end

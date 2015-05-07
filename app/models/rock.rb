class Rock < ActiveRecord::Base
  belongs_to :field
end

f1 = Field.find_or_create_by(name: 'Software Development')
f2 = Field.find_or_create_by(name: 'It')
r1 = f2.rocks.create name: 'Ruby On Rails'
r2 = f2.rocks.create name: 'Ruby'

# The below won't work
# Field.includes(:rocks).where("rocks.name = 'Ruby'")
fields = Field.includes(:rocks)
Field.includes(:rocks).where("rocks.name = 'Ruby'").references(:rocks)

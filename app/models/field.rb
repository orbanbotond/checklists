class Field < ActiveRecord::Base
  validates :name, presence: true
end

# # f = Field.find_or_create_by(description: 'valami mas')
# f = Field.find_or_create_by(name: 'Juhar')
# f = Field.find_or_create_by(name: 'Bukk')
# f = Field.find_or_create_by(name: 'Tolgy')
# f.persisted?
# f.id
# f.valid?
# f.errors

# Field.order(name: :desc, description: :asc).reverse_order
# Field.where(name: 'Bukk').where(name: 'Tolgy')
# Field.where(name: 'Bukk').rewhere.not(name: 'Tolgy')
# Field.where.not(name: 'Bukk')
# Field.ids
# Field.pluck :id
# Field.pluck :id, :name

# Field.any?
# Field.many?
# Field.exists?
# Field.exists? id: 1
# Field.exists? id: [1, 3]
# Field.exists? id: 3
# Field.exists? name: 'Juhar'
# Field.exists? name: ['Bukk', 'Fuz']
# Field.exists? name: ['Tolgy', 'Fuz']

# Client.where("created_at >= :start_date AND created_at <= :end_date",
#   {start_date: params[:start_date], end_date: params[:end_date]})


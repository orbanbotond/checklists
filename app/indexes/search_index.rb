class SearchIndex < Chewy::Index
  settings analysis: {
    analyzer: {
      title: {
        tokenizer: 'standard',
        filter:  %w(lowercase asciifolding)
      }
    }
  }

  define_type Recipe.includes(:tasks) do
    field :account_id, value: -> (recipe) { recipe.account_id }
    field :name, analyzer: 'title'
    field :descriptions, value: -> { tasks.map(&:description) }
  end
end

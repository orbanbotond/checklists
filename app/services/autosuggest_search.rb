AutosuggestSearch = Struct.new(:account)

class AutosuggestSearch
  def execute(search_term)
    res = SearchIndex.filter(term: { account_id: account.id }).query(multi_match: { query: search_term, fields: %w(name descriptions) })
    res.preload.map(&:_object)
  end
end

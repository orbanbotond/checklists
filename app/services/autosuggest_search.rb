class AutosuggestSearch < Struct.new(:account)

  def execute(search_term)
    res = SearchIndex.filter(term: {account_id: account.id}).query( multi_match: { query: search_term, fields: ['name', 'descriptions']})
    res.preload.map(&:_object)
  end

end

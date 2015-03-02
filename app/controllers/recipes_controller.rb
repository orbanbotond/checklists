class RecipesController < RestfullController

  def end_of_association_chain
    super.scoped_to(current_account)
  end

end

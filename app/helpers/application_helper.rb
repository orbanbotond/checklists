module ApplicationHelper
  def has_recipes?
    Recipe.scoped_to(current_account).present?
  end

  def alert_class(k)
    alerts = {:success => 'alert-success', :notice => 'alert-success', :alert => 'alert-warning', :error => 'alert-danger'}
    alerts[k.to_sym]
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end

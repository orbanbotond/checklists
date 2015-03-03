RSpec::Matchers.define :filter do |kind, filter|
  match do |controller|
    extra = -> (x) {true}
    if filter[:except].present?
      extra = -> (x) { x.options[:unless].any?{ |x| x=~ /action_name == '#{filter[:except]}'/ } }
    elsif filter[:only].present?
      extra = -> (x) { x.options[:if].any?{ |x| x=~ /action_name == '#{filter[:only]}'/ } }
    end
    controller._process_action_callbacks.find do |x|
      x.kind == kind && x.filter == filter[:with] && extra.call(x)
    end
  end
end
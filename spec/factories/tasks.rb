FactoryGirl.define do
  factory :task do
    sequence(:description) {|n| "#{ ActiveSupport::Inflector.ordinalize(n)} task" }
    association :checkable, :factory => :checklist
  end

end

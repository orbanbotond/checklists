require 'rails_helper'

describe ChecklistListener do

  class A
    include Wisper::Publisher

    def test_broadcast(cl)
      broadcast :update_checklist, cl
    end
  end

  let(:checklist) { create :checklist }

  it 'receives :update_checklist event on Checklist#after_save' do
    expect_any_instance_of(ChecklistListener).to receive(:update_checklist).and_return(checklist)
    A.new.test_broadcast checklist
  end
end

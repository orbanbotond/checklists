require 'rails_helper'

describe ChecklistListener do

  context 'registration as wisper listener' do
    class A
      include Wisper::Publisher

      def test_broadcast(cl)
        broadcast :update_checklist, cl
      end
    end

    let(:checklist) { create :checklist }

    it 'is registered as a listener' do
      expect_any_instance_of(ChecklistListener).to receive(:update_checklist).and_return(checklist)
      A.new.test_broadcast checklist
    end
  end

  context 'business logic' do
    context 'nonexistent recipe' do
      let(:task1) { create :task, checkable: checklist }
      let(:task2) { create :task, checkable: checklist }
      let(:checklist) { create :checklist, recipe: nil }
      let(:listener) { subject }

      it "populates the recipe field" do
        listener.update_checklist checklist
        expect(checklist.reload.recipe).to be_present
      end

      it "populates the tasks" do
        task1
        task2
        listener.update_checklist checklist
        expect(checklist.recipe.tasks.count).to eq(2)
      end
    end
    context 'adds the task to the existent recipe' do
      let(:task1) { create :task, checkable: checklist }
      let(:task2) { create :task, checkable: checklist }
      let(:checklist) { create :checklist }
      let(:recipe) do
        checklist.recipe.tasks.create description: task1.description
        checklist.recipe
      end
      let(:listener) { subject }

      it "adds the missing task to the recipe" do
        recipe
        task1
        task2
        listener.update_checklist checklist
        expect(checklist.recipe.tasks.count).to eq(2)
      end
    end

  end
end

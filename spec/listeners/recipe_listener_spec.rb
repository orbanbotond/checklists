require 'rails_helper'

describe RecipeListener do
  let(:account) { create :account }

  context 'registration as wisper listener' do
    class A
      include Wisper::Publisher

      def test_broadcast(cl, account)
        broadcast :update_recipe, cl, account
      end
    end

    let(:checklist) { create :checklist }

    it 'is registered as a listener' do
      expect_any_instance_of(RecipeListener).to receive(:update_recipe).and_return(checklist)
      A.new.test_broadcast checklist, account
    end
  end

  context 'business logic' do
    context 'nonexistent recipe' do
      let!(:task1) { create :task, checkable: checklist }
      let!(:task2) { create :task, checkable: checklist }
      let(:checklist) { create :checklist, recipe: nil }
      let(:listener) { subject }

      it "populates the recipe field" do
        listener.update_recipe checklist, account
        expect(checklist.reload.recipe).to be_present
      end

      it "populates the tasks" do
        listener.update_recipe checklist, account
        expect(checklist.recipe.tasks.count).to eq(2)
      end
    end
    context 'name is different that the recipes name' do
      let!(:task1) { create :task, checkable: checklist }
      let!(:task2) { create :task, checkable: checklist }
      let(:recipe) do
        r = create :recipe, name: 'Other than the checklists one'
        r.tasks.create description: 'task1.description'
        r
      end
      let(:checklist) { create :checklist, recipe: recipe }
      let(:listener) { subject }

      it "creates a new recipe" do
        listener.update_recipe checklist, account
        expect(checklist.recipe).to_not eq(recipe)
      end
      it "populates the name" do
        listener.update_recipe checklist, account
        expect(checklist.recipe.name).to eq(checklist.name)
      end
      it "populates the tasks" do
        listener.update_recipe checklist, account
        expect(checklist.recipe.tasks.count).to eq(2)
        expect(checklist.recipe.tasks.map(&:description).sort).to eq([task1.description, task2.description].sort)
      end
    end
    context 'adds the task to the existent recipe' do
      let!(:task1) { create :task, checkable: checklist }
      let!(:task2) { create :task, checkable: checklist }
      let(:checklist) { create :checklist }
      let!(:recipe) do
        checklist.recipe.tasks.create description: task1.description
        checklist.recipe
      end
      let(:listener) { subject }

      it "adds the missing task to the recipe" do
        listener.update_recipe checklist, account
        expect(checklist.recipe.tasks.count).to eq(2)
      end
    end

  end
end

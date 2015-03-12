namespace :index do
  desc "Reindex the recipes and checklists and tasks"
  task :redo => :environment do
    SearchIndex.reset!
  end
end

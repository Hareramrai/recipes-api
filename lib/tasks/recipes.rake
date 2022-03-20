namespace :recipes do
  desc "import recipes from recipes-english url"
  task import: :environment do
    puts '*** Starting the import ***'
    Recipes::ImportService.call
    puts '*** Finish the import ***'
  end
end

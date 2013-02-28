desc 'Import JSON dump'
task import_json: :environment do
  load = JSON.load(File.read(Rails.root.join('lib', 'json.dump')))
  poems = Poem.new(load, without_protection: true)
  poems.save
end

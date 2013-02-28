desc 'Import JSON dump'
task import_json: :environment do
  load = JSON.load(File.read(Rails.root.join('lib', 'json.dump')))
  load.map!(&:symbolize_keys)
  poems = Poem.create(load, without_protection: true)
  poems.save
end

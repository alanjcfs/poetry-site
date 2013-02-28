desc 'Import JSON dump'
task :import_json do
  load = JSON.load(File.read(Rails.root.join('lib', 'json.dump')))
  Poem.create(load)
end

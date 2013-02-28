desc 'import johnsons'
task import_johnsons: :environment do
  files = Dir.glob('./lib/johnsons/*')
  array = files.map do |file|
    { johnson: file.split('/').last.to_i, text: File.read(file) }
  end
  Poem.create(array)
end

Barista.configure do |scripts|
  scripts.root = 'assets/javascripts'
  scripts.output_root = 'public/javascripts/compiled'
  scripts.bare!
end
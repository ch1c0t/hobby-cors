Gem::Specification.new do |g|
  g.name    = 'hobby-cors'
  g.files   = ['lib/hobby/cors.rb']
  g.version = '0.1.1'
  g.summary = 'A Rack middleware for CORS, with permissive defaults.'
  g.authors = ['Anatoly Chernov']
  g.email   = ['chertoly@gmail.com']
  g.license = 'ISC'
  g.homepage = 'https://github.com/ch1c0t/hobby-cors'

  g.add_dependency 'rack', '>= 2', '< 4'
end

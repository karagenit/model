Gem::Specification.new do |s|
    s.name          = 'belir'
    s.version       = IO.read('version.txt')
    s.license       = 'MIT'
    s.summary       = 'Solve Systems of Equations'
    s.description   = 'Compute Solutions to Sets of Equations Given Certain Values'
    s.homepage      = 'https://github.com/karagenit/model'
    s.author        = 'Caleb Smith'
    s.email         = 'karagenit@outlook.com'
    s.files         = ['lib/belir.rb']
    s.require_paths = ['lib/']
    s.platform      = Gem::Platform::RUBY

    s.add_development_dependency 'rubocop',                     '~> 0.49'
    s.add_development_dependency 'rdoc',                        '~> 4.2'
    s.add_development_dependency 'bundler',                     '~> 1.15'
    s.add_development_dependency 'rake',                        '~> 12.0'
    s.add_development_dependency 'test-unit',                   '~> 3.2'
    s.add_development_dependency 'github_changelog_generator',  '~> 1.14'
end

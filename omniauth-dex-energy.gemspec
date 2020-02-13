# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-dex-energy'
  spec.version       = '0.1.0'
  spec.authors       = ['Cera Davies', 'Nick Burgin', 'Mike Williams']
  spec.email         = [
    'ceralena.davies@gmail.com',
    'nick.burgin@greensync.com.au',
    'mike.williams@greensync.com.au',
  ]

  spec.summary       = 'an OmniAuth strategy for authenticating with deX'
  spec.description   = 'an OmniAuth strategy for authenticating with deX'
  spec.homepage      = 'https://github.com/greensync/omniauth-dex-energy'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    Dir.glob('{bin,doc,examples,lib}/**/*') + %w[
      README.md omniauth-dex-energy.gemspec
    ]
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/releases"

  spec.add_dependency 'omniauth-oauth2', '~> 1.6.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry-byebug', '~> 3.8.0'
  spec.add_development_dependency 'rack'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.77'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.37.0'
end

# frozen_string_literal: true

gem_version = `git describe --tags --abbrev=0`.strip.sub(/^v/, '')

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 3.1'
  spec.name          = 'omniauth-dex-energy'
  spec.version       = gem_version
  spec.authors       = ['Cera Davies', 'Nick Burgin', 'Mike Williams']
  spec.email         = [
    'internalplatform@greensync.com.au',
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
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.add_dependency 'omniauth-oauth2', '~> 1.8'
end

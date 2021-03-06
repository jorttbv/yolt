# frozen_string_literal: true

require_relative 'lib/yolt/version'

Gem::Specification.new do |spec|
  spec.name = 'yolt'
  spec.version = Yolt::VERSION
  spec.authors = ['Bob Forma', 'Mike van Diepen']
  spec.email = ['bforma@zilverline.com', 'mvdiepen@zilverline.com']

  spec.summary = 'A Ruby client for the Yolt API'
  spec.description = 'A Ruby client for the Yolt API'
  spec.homepage = 'https://github.com/jorttbv/yolt'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/jorttbv/yolt'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rest-client', '~> 2.1.0'
  spec.add_runtime_dependency 'thread_safe', '~> 0.3.6'

  spec.add_development_dependency 'pry', '~> 0.12.2'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'rubocop', '~> 0.80.0'
  spec.add_development_dependency 'vcr', '~> 5.1.0'
  spec.add_development_dependency 'webmock', '~> 3.8.2'
end

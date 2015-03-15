Gem::Specification.new do |s|
  s.name = 'if'
  s.summary = 'A Ruby implementation of the if conditional.'
  s.description = 'A heavily Smalltalk-inspired implementation of the if conditional without using keywords.'
  s.version = '1.2.0'
  s.license = 'MIT'
  s.authors = ['Paul Mucur']
  s.homepage = 'https://github.com/mudge/if'
  s.email = 'ruby.if@librelist.com'
  s.files = ['lib/if.rb']
  s.test_files = ['spec/if_spec.rb', 'spec/spec_helper.rb']
  s.add_development_dependency('rspec', '~> 3.2')
end

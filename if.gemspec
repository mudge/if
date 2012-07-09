Gem::Specification.new do |s|
  s.name = "if"
  s.summary = "A Ruby implementation of the if conditional."
  s.description = "A heavily Smalltalk-inspired implementation of the if conditional without using keywords."
  s.version = "1.0.0"
  s.authors = ["Paul Mucur"]
  s.homepage = "http://github.com/mudge/if"
  s.email = "ruby.if@librelist.com"
  s.files = ["lib/if.rb"]
  s.test_files = ["spec/if_spec.rb"]
  s.add_development_dependency("minitest")
end
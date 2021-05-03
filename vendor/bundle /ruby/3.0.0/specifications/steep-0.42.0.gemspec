# -*- encoding: utf-8 -*-
# stub: steep 0.42.0 ruby lib

Gem::Specification.new do |s|
  s.name = "steep".freeze
  s.version = "0.42.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/soutaro/steep/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/soutaro/steep", "source_code_uri" => "https://github.com/soutaro/steep" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Soutaro Matsumoto".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-03-08"
  s.description = "Gradual Typing for Ruby".freeze
  s.email = ["matsumoto@soutaro.com".freeze]
  s.executables = ["steep".freeze]
  s.files = ["exe/steep".freeze]
  s.homepage = "https://github.com/soutaro/steep".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.2.15".freeze
  s.summary = "Gradual Typing for Ruby".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<parser>.freeze, [">= 2.7"])
    s.add_runtime_dependency(%q<ast_utils>.freeze, [">= 0.4.0"])
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 5.1"])
    s.add_runtime_dependency(%q<rainbow>.freeze, [">= 2.2.2", "< 4.0"])
    s.add_runtime_dependency(%q<listen>.freeze, ["~> 3.0"])
    s.add_runtime_dependency(%q<language_server-protocol>.freeze, ["~> 3.15.0.1"])
    s.add_runtime_dependency(%q<rbs>.freeze, ["~> 1.1.0"])
    s.add_runtime_dependency(%q<parallel>.freeze, [">= 1.0.0"])
  else
    s.add_dependency(%q<parser>.freeze, [">= 2.7"])
    s.add_dependency(%q<ast_utils>.freeze, [">= 0.4.0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 5.1"])
    s.add_dependency(%q<rainbow>.freeze, [">= 2.2.2", "< 4.0"])
    s.add_dependency(%q<listen>.freeze, ["~> 3.0"])
    s.add_dependency(%q<language_server-protocol>.freeze, ["~> 3.15.0.1"])
    s.add_dependency(%q<rbs>.freeze, ["~> 1.1.0"])
    s.add_dependency(%q<parallel>.freeze, [">= 1.0.0"])
  end
end

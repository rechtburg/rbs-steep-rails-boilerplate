# -*- encoding: utf-8 -*-
# stub: rbs_rails 0.8.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rbs_rails".freeze
  s.version = "0.8.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/pocke/rbs_rails/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/pocke/rbs_rails", "source_code_uri" => "https://github.com/pocke/rbs_rails" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Masataka Pocke Kuwabara".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-02-20"
  s.description = "A RBS files generator for Rails application".freeze
  s.email = ["kuwabara@pocke.me".freeze]
  s.homepage = "https://github.com/pocke/rbs_rails".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.2.15".freeze
  s.summary = "A RBS files generator for Rails application".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<parser>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rbs>.freeze, [">= 1"])
  else
    s.add_dependency(%q<parser>.freeze, [">= 0"])
    s.add_dependency(%q<rbs>.freeze, [">= 1"])
  end
end

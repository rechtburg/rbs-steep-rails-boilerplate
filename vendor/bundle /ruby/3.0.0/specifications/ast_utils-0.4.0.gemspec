# -*- encoding: utf-8 -*-
# stub: ast_utils 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ast_utils".freeze
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Soutaro Matsumoto".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-12-30"
  s.description = "Ruby AST Utility".freeze
  s.email = ["matsumoto@soutaro.com".freeze]
  s.executables = ["ast_utils".freeze]
  s.files = ["exe/ast_utils".freeze]
  s.homepage = "https://github.com/soutaro/ast_utils".freeze
  s.rubygems_version = "3.2.15".freeze
  s.summary = "Ruby AST Utility".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<parser>.freeze, [">= 2.7.0"])
  else
    s.add_dependency(%q<parser>.freeze, [">= 2.7.0"])
  end
end

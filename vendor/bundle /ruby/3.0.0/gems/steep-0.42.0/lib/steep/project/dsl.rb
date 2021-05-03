module Steep
  class Project
    class DSL
      class TargetDSL
        attr_reader :name
        attr_reader :sources
        attr_reader :libraries
        attr_reader :signatures
        attr_reader :ignored_sources
        attr_reader :vendor_dir
        attr_reader :strictness_level
        attr_reader :typing_option_hash
        attr_reader :repo_paths

        def initialize(name, sources: [], libraries: [], signatures: [], ignored_sources: [], repo_paths: [])
          @name = name
          @sources = sources
          @libraries = libraries
          @signatures = signatures
          @ignored_sources = ignored_sources
          @vendor_dir = nil
          @strictness_level = :default
          @typing_option_hash = {}
          @repo_paths = []
        end

        def initialize_copy(other)
          @name = other.name
          @sources = other.sources.dup
          @libraries = other.libraries.dup
          @signatures = other.signatures.dup
          @ignored_sources = other.ignored_sources.dup
          @vendor_dir = other.vendor_dir
          @strictness_level = other.strictness_level
          @typing_option_hash = other.typing_option_hash
          @repo_paths = other.repo_paths.dup
        end

        def check(*args)
          sources.push(*args)
        end

        def ignore(*args)
          ignored_sources.push(*args)
        end

        def library(*args)
          libraries.push(*args)
        end

        def typing_options(level = @strictness_level, **hash)
          @strictness_level = level
          @typing_option_hash = hash
        end

        def signature(*args)
          signatures.push(*args)
        end

        def update(name: self.name, sources: self.sources, libraries: self.libraries, ignored_sources: self.ignored_sources, signatures: self.signatures)
          self.class.new(
            name,
            sources: sources,
            libraries: libraries,
            signatures: signatures,
            ignored_sources: ignored_sources
          )
        end

        def no_builtin!(value = true)
          Steep.logger.error "`no_builtin!` in Steepfile is deprecated and ignored. Use `vendor` instead."
        end

        def vendor(dir = "vendor/sigs", stdlib: nil, gems: nil)
          if stdlib || gems
            Steep.logger.warn { "#vendor with stdlib: or gems: keyword is deprecated." }
          end

          @vendor_dir = Pathname(dir)
        end

        def repo_path(*paths)
          @repo_paths.push(*paths.map {|s| Pathname(s) })
        end
      end

      attr_reader :project

      @@templates = {
        gemfile: TargetDSL.new(:gemfile).tap do |target|
          target.check "Gemfile"
          target.library "gemfile"
        end
      }

      def self.templates
        @@templates
      end

      def initialize(project:)
        @project = project
        @global_signatures = []
      end

      def self.register_template(name, target)
        templates[name] = target
      end

      def self.parse(project, code, filename: "Steepfile")
        self.new(project: project).instance_eval(code, filename)
      end

      def target(name, template: nil, &block)
        target = if template
                   self.class.templates[template]&.dup&.update(name: name) or
                     raise "Unknown template: #{template}, available templates: #{@@templates.keys.join(", ")}"
                 else
                   TargetDSL.new(name)
                 end

        target.instance_eval(&block) if block_given?

        source_pattern = Pattern.new(patterns: target.sources, ignores: target.ignored_sources, ext: ".rb")
        signature_pattern = Pattern.new(patterns: target.signatures, ext: ".rbs")

        Project::Target.new(
          name: target.name,
          source_pattern: source_pattern,
          signature_pattern: signature_pattern,
          options: Options.new.tap do |options|
            options.libraries.push(*target.libraries)
            options.repository_paths.push(*target.repo_paths)
            options.vendor_path = target.vendor_dir

            case target.strictness_level
            when :strict
              options.apply_strict_typing_options!
            when :lenient
              options.apply_lenient_typing_options!
            end

            options.merge!(target.typing_option_hash)
          end
        ).tap do |target|
          project.targets << target
        end
      end
    end
  end
end

module Steep
  module Diagnostic
    module Signature
      class Base
        include Helper

        attr_reader :location

        def initialize(location:)
          @location = location
        end

        def header_line
          StringIO.new.tap do |io|
            puts io
          end.string
        end

        def detail_lines
          nil
        end

        def diagnostic_code
          "RBS::#{error_name}"
        end

        def path
          location.buffer.name
        end
      end

      class SyntaxError < Base
        attr_reader :exception

        def initialize(exception, location:)
          super(location: location)
          @exception = exception
        end

        def header_line
          if exception.is_a?(RBS::Parser::SyntaxError)
            value = if exception.error_value.is_a?(RBS::Parser::LocatedValue)
                      exception.error_value.value
                    else
                      exception.error_value
                    end
            string = value.to_s
            unless string.empty?
              string = " (#{string})"
            end

            "Syntax error caused by token `#{exception.token_str}`#{string}"
          else
            exception.message
          end
        end
      end

      class DuplicatedDeclaration < Base
        attr_reader :type_name

        def initialize(type_name:, location:)
          super(location: location)
          @type_name = type_name
        end

        def header_line
          "Declaration of `#{type_name}` is duplicated"
        end
      end

      class UnknownTypeName < Base
        attr_reader :name

        def initialize(name:, location:)
          super(location: location)
          @name = name
        end

        def header_line
          "Cannot find type `#{name}`"
        end
      end

      class InvalidTypeApplication < Base
        attr_reader :name
        attr_reader :args
        attr_reader :params

        def initialize(name:, args:, params:, location:)
          super(location: location)
          @name = name
          @args = args
          @params = params
        end

        def header_line
          case
          when params.empty?
            "Type `#{name}` is not generic but used as a generic type with #{args.size} arguments"
          when args.empty?
            "Type `#{name}` is generic but used as a non generic type"
          else
            "Type `#{name}` expects #{params.size} arguments, but #{args.size} arguments are given"
          end
        end
      end

      class InvalidMethodOverload < Base
        attr_reader :class_name
        attr_reader :method_name

        def initialize(class_name:, method_name:, location:)
          super(location: location)
          @class_name = class_name
          @method_name = method_name
        end

        def header_line
          "Cannot find a non-overloading definition of `#{method_name}` in `#{class_name}`"
        end
      end

      class UnknownMethodAlias < Base
        attr_reader :class_name
        attr_reader :method_name

        def initialize(class_name:, method_name:, location:)
          super(location: location)
          @class_name = class_name
          @method_name = method_name
        end

        def header_line
          "Cannot find the original method `#{method_name}` in `#{class_name}`"
        end
      end

      class DuplicatedMethodDefinition < Base
        attr_reader :class_name
        attr_reader :method_name

        def initialize(class_name:, method_name:, location:)
          super(location: location)
          @class_name = class_name
          @method_name = method_name
        end

        def header_line
          "Non-overloading method definition of `#{method_name}` in `#{class_name}` cannot be duplicated"
        end
      end

      class RecursiveAlias < Base
        attr_reader :class_name
        attr_reader :names
        attr_reader :location

        def initialize(class_name:, names:, location:)
          super(location: location)
          @class_name = class_name
          @names = names
        end

        def header_line
          "Circular method alias is detected in `#{class_name}`: #{names.join(" -> ")}"
        end
      end

      class RecursiveAncestor < Base
        attr_reader :ancestors

        def initialize(ancestors:, location:)
          super(location: location)
          @ancestors = ancestors
        end

        def header_line
          names = ancestors.map do |ancestor|
            case ancestor
            when RBS::Definition::Ancestor::Singleton
              "singleton(#{ancestor.name})"
            when RBS::Definition::Ancestor::Instance
              if ancestor.args.empty?
                ancestor.name.to_s
              else
                "#{ancestor.name}[#{ancestor.args.join(", ")}]"
              end
            end
          end

          "Circular inheritance/mix-in is detected: #{names.join(" <: ")}"
        end
      end

      class SuperclassMismatch < Base
        attr_reader :name

        def initialize(name:, location:)
          super(location: location)
          @name = name
        end

        def header_line
          "Different superclasses are specified for `#{name}`"
        end
      end

      class GenericParameterMismatch < Base
        attr_reader :name

        def initialize(name:, location:)
          super(location: location)
          @name = name
        end

        def header_line
          "Different generic parameters are specified across definitions of `#{name}`"
        end
      end

      class InvalidVarianceAnnotation < Base
        attr_reader :name
        attr_reader :param

        def initialize(name:, param:, location:)
          super(location: location)
          @name = name
          @param = param
        end

        def header_line
          "The variance of type parameter `#{param.name}` is #{param.variance}, but used in incompatible position here"
        end
      end

      class ModuleSelfTypeError < Base
        attr_reader :name
        attr_reader :ancestor
        attr_reader :relation

        def initialize(name:, ancestor:, relation:, location:)
          super(location: location)

          @name = name
          @ancestor = ancestor
          @relation = relation
        end

        def header_line
          "Module self type constraint in type `#{name}` doesn't satisfy: `#{relation}`"
        end
      end

      class InstanceVariableTypeError < Base
        attr_reader :name
        attr_reader :variable
        attr_reader :var_type
        attr_reader :parent_type

        def initialize(name:, location:, var_type:, parent_type:)
          super(location: location)

          @name = name
          @var_type = var_type
          @parent_type = parent_type
        end

        def header_line
          "Instance variable cannot have different type with parents: #{var_type} <=> #{parent_type}"
        end
      end

      def self.from_rbs_error(error, factory:)
        case error
        when RBS::Parser::SemanticsError, RBS::Parser::LexerError
          Diagnostic::Signature::SyntaxError.new(error, location: error.location)
        when RBS::Parser::SyntaxError
          Diagnostic::Signature::SyntaxError.new(error, location: error.error_value.location)
        when RBS::DuplicatedDeclarationError
          Diagnostic::Signature::DuplicatedDeclaration.new(
            type_name: error.name,
            location: error.decls[0].location
          )
        when RBS::GenericParameterMismatchError
          Diagnostic::Signature::GenericParameterMismatch.new(
            name: error.name,
            location: error.decl.location
          )
        when RBS::InvalidTypeApplicationError
          Diagnostic::Signature::InvalidTypeApplication.new(
            name: error.type_name,
            args: error.args.map {|ty| factory.type(ty) },
            params: error.params,
            location: error.location
          )
        when RBS::NoTypeFoundError,
          RBS::NoSuperclassFoundError,
          RBS::NoMixinFoundError,
          RBS::NoSelfTypeFoundError
          Diagnostic::Signature::UnknownTypeName.new(
            name: error.type_name,
            location: error.location
          )
        when RBS::InvalidOverloadMethodError
          Diagnostic::Signature::InvalidMethodOverload.new(
            class_name: error.type_name,
            method_name: error.method_name,
            location: error.members[0].location
          )
        when RBS::DuplicatedMethodDefinitionError
          Diagnostic::Signature::DuplicatedMethodDefinition.new(
            class_name: error.type_name,
            method_name: error.method_name,
            location: error.location
          )
        when RBS::DuplicatedInterfaceMethodDefinitionError
          Diagnostic::Signature::DuplicatedMethodDefinition.new(
            class_name: error.type_name,
            method_name: error.method_name,
            location: error.member.location
          )
        when RBS::UnknownMethodAliasError
          Diagnostic::Signature::UnknownMethodAlias.new(
            class_name: error.type_name,
            method_name: error.original_name,
            location: error.location
          )
        when RBS::RecursiveAliasDefinitionError
          Diagnostic::Signature::RecursiveAlias.new(
            class_name: error.type.name,
            names: error.defs.map(&:name),
            location: error.defs[0].original.location
          )
        when RBS::RecursiveAncestorError
          Diagnostic::Signature::RecursiveAncestor.new(
            ancestors: error.ancestors,
            location: error.location
          )
        when RBS::SuperclassMismatchError
          Diagnostic::Signature::SuperclassMismatch.new(
            name: error.name,
            location: error.entry.primary.decl.location
          )
        when RBS::InvalidVarianceAnnotationError
          Diagnostic::Signature::InvalidVarianceAnnotation.new(
            name: error.type_name,
            param: error.param,
            location: error.location
          )
        else
          raise error
        end
      end
    end
  end
end

module Steep
  module AST
    module Types
      class Self
        attr_reader :location

        def initialize(location: nil)
          @location = location
        end

        def ==(other)
          other.is_a?(Self)
        end

        def hash
          self.class.hash
        end

        alias eql? ==

        def to_s
          "self"
        end

        def subst(s)
          s.self_type or raise "Unexpected substitution: #{inspect}"
        end

        def free_variables
          @fvs ||= Set.new([self])
        end

        def level
          [0]
        end

        def with_location(new_location)
          self.class.new(location: new_location)
        end
      end
    end
  end
end

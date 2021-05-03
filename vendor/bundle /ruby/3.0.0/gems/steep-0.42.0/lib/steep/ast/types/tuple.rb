module Steep
  module AST
    module Types
      class Tuple
        attr_reader :types
        attr_reader :location

        def initialize(types:, location: nil)
          @types = types
          @location = location
        end

        def ==(other)
          other.is_a?(Tuple) &&
            other.types == types
        end

        def hash
          self.class.hash ^ types.hash
        end

        alias eql? ==

        def subst(s)
          self.class.new(location: location,
                         types: types.map {|ty| ty.subst(s) })
        end

        def to_s
          "[#{types.join(", ")}]"
        end

        def free_variables()
          @fvs ||= Set.new.tap do |set|
            types.each do |type|
              set.merge(type.free_variables)
            end
          end
        end

        include Helper::ChildrenLevel

        def level
          [0] + level_of_children(types)
        end

        def with_location(new_location)
          self.class.new(types: types, location: new_location)
        end
      end
    end
  end
end

module LanguageServer
  module Protocol
    module Interface
      #
      # Represents the signature of something callable. A signature
      # can have a label, like a function-name, a doc-comment, and
      # a set of parameters.
      #
      class SignatureInformation
        def initialize(label:, documentation: nil, parameters: nil)
          @attributes = {}

          @attributes[:label] = label
          @attributes[:documentation] = documentation if documentation
          @attributes[:parameters] = parameters if parameters

          @attributes.freeze
        end

        #
        # The label of this signature. Will be shown in
        # the UI.
        #
        # @return [string]
        def label
          attributes.fetch(:label)
        end

        #
        # The human-readable doc-comment of this signature. Will be shown
        # in the UI but can be omitted.
        #
        # @return [string | MarkupContent]
        def documentation
          attributes.fetch(:documentation)
        end

        #
        # The parameters of this signature.
        #
        # @return [ParameterInformation[]]
        def parameters
          attributes.fetch(:parameters)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end

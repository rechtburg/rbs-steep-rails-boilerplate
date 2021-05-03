module LanguageServer
  module Protocol
    module Interface
      class PrepareRenameParams < TextDocumentPositionParams
        def initialize(text_document:, position:)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:position] = position

          @attributes.freeze
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

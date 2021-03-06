module LanguageServer
  module Protocol
    module Interface
      #
      # Text document specific client capabilities.
      #
      class TextDocumentClientCapabilities
        def initialize(synchronization: nil, completion: nil, hover: nil, signature_help: nil, declaration: nil, definition: nil, type_definition: nil, implementation: nil, references: nil, document_highlight: nil, document_symbol: nil, code_action: nil, code_lens: nil, document_link: nil, color_provider: nil, formatting: nil, range_formatting: nil, on_type_formatting: nil, rename: nil, publish_diagnostics: nil, folding_range: nil, selection_range: nil)
          @attributes = {}

          @attributes[:synchronization] = synchronization if synchronization
          @attributes[:completion] = completion if completion
          @attributes[:hover] = hover if hover
          @attributes[:signatureHelp] = signature_help if signature_help
          @attributes[:declaration] = declaration if declaration
          @attributes[:definition] = definition if definition
          @attributes[:typeDefinition] = type_definition if type_definition
          @attributes[:implementation] = implementation if implementation
          @attributes[:references] = references if references
          @attributes[:documentHighlight] = document_highlight if document_highlight
          @attributes[:documentSymbol] = document_symbol if document_symbol
          @attributes[:codeAction] = code_action if code_action
          @attributes[:codeLens] = code_lens if code_lens
          @attributes[:documentLink] = document_link if document_link
          @attributes[:colorProvider] = color_provider if color_provider
          @attributes[:formatting] = formatting if formatting
          @attributes[:rangeFormatting] = range_formatting if range_formatting
          @attributes[:onTypeFormatting] = on_type_formatting if on_type_formatting
          @attributes[:rename] = rename if rename
          @attributes[:publishDiagnostics] = publish_diagnostics if publish_diagnostics
          @attributes[:foldingRange] = folding_range if folding_range
          @attributes[:selectionRange] = selection_range if selection_range

          @attributes.freeze
        end

        # @return [TextDocumentSyncClientCapabilities]
        def synchronization
          attributes.fetch(:synchronization)
        end

        #
        # Capabilities specific to the `textDocument/completion` request.
        #
        # @return [CompletionClientCapabilities]
        def completion
          attributes.fetch(:completion)
        end

        #
        # Capabilities specific to the `textDocument/hover` request.
        #
        # @return [HoverClientCapabilities]
        def hover
          attributes.fetch(:hover)
        end

        #
        # Capabilities specific to the `textDocument/signatureHelp` request.
        #
        # @return [SignatureHelpClientCapabilities]
        def signature_help
          attributes.fetch(:signatureHelp)
        end

        #
        # Capabilities specific to the `textDocument/declaration` request.
        #
        # @return [DeclarationClientCapabilities]
        def declaration
          attributes.fetch(:declaration)
        end

        #
        # Capabilities specific to the `textDocument/definition` request.
        #
        # @return [DefinitionClientCapabilities]
        def definition
          attributes.fetch(:definition)
        end

        #
        # Capabilities specific to the `textDocument/typeDefinition` request.
        #
        # @return [TypeDefinitionClientCapabilities]
        def type_definition
          attributes.fetch(:typeDefinition)
        end

        #
        # Capabilities specific to the `textDocument/implementation` request.
        #
        # @return [ImplementationClientCapabilities]
        def implementation
          attributes.fetch(:implementation)
        end

        #
        # Capabilities specific to the `textDocument/references` request.
        #
        # @return [ReferenceClientCapabilities]
        def references
          attributes.fetch(:references)
        end

        #
        # Capabilities specific to the `textDocument/documentHighlight` request.
        #
        # @return [DocumentHighlightClientCapabilities]
        def document_highlight
          attributes.fetch(:documentHighlight)
        end

        #
        # Capabilities specific to the `textDocument/documentSymbol` request.
        #
        # @return [DocumentSymbolClientCapabilities]
        def document_symbol
          attributes.fetch(:documentSymbol)
        end

        #
        # Capabilities specific to the `textDocument/codeAction` request.
        #
        # @return [CodeActionClientCapabilities]
        def code_action
          attributes.fetch(:codeAction)
        end

        #
        # Capabilities specific to the `textDocument/codeLens` request.
        #
        # @return [CodeLensClientCapabilities]
        def code_lens
          attributes.fetch(:codeLens)
        end

        #
        # Capabilities specific to the `textDocument/documentLink` request.
        #
        # @return [DocumentLinkClientCapabilities]
        def document_link
          attributes.fetch(:documentLink)
        end

        #
        # Capabilities specific to the `textDocument/documentColor` and the
        # `textDocument/colorPresentation` request.
        #
        # @return [DocumentColorClientCapabilities]
        def color_provider
          attributes.fetch(:colorProvider)
        end

        #
        # Capabilities specific to the `textDocument/formatting` request.
        #
        # @return [DocumentFormattingClientCapabilities]
        def formatting
          attributes.fetch(:formatting)
        end

        #
        # Capabilities specific to the `textDocument/rangeFormatting` request.
        #
        # @return [DocumentRangeFormattingClientCapabilities]
        def range_formatting
          attributes.fetch(:rangeFormatting)
        end

        #
        # request.
        # Capabilities specific to the `textDocument/onTypeFormatting` request.
        #
        # @return [DocumentOnTypeFormattingClientCapabilities]
        def on_type_formatting
          attributes.fetch(:onTypeFormatting)
        end

        #
        # Capabilities specific to the `textDocument/rename` request.
        #
        # @return [RenameClientCapabilities]
        def rename
          attributes.fetch(:rename)
        end

        #
        # Capabilities specific to the `textDocument/publishDiagnostics` notification.
        #
        # @return [PublishDiagnosticsClientCapabilities]
        def publish_diagnostics
          attributes.fetch(:publishDiagnostics)
        end

        #
        # Capabilities specific to the `textDocument/foldingRange` request.
        #
        # @return [FoldingRangeClientCapabilities]
        def folding_range
          attributes.fetch(:foldingRange)
        end

        #
        # Capabilities specific to the `textDocument/selectionRange` request.
        #
        # @return [SelectionRangeClientCapabilities]
        def selection_range
          attributes.fetch(:selectionRange)
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

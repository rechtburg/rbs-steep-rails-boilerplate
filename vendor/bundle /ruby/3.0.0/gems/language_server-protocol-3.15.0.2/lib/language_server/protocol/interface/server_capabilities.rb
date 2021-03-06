module LanguageServer
  module Protocol
    module Interface
      class ServerCapabilities
        def initialize(text_document_sync: nil, completion_provider: nil, hover_provider: nil, signature_help_provider: nil, declaration_provider: nil, definition_provider: nil, type_definition_provider: nil, implementation_provider: nil, references_provider: nil, document_highlight_provider: nil, document_symbol_provider: nil, code_action_provider: nil, code_lens_provider: nil, document_link_provider: nil, color_provider: nil, document_formatting_provider: nil, document_range_formatting_provider: nil, document_on_type_formatting_provider: nil, rename_provider: nil, folding_range_provider: nil, execute_command_provider: nil, selection_range_provider: nil, workspace_symbol_provider: nil, workspace: nil, experimental: nil)
          @attributes = {}

          @attributes[:textDocumentSync] = text_document_sync if text_document_sync
          @attributes[:completionProvider] = completion_provider if completion_provider
          @attributes[:hoverProvider] = hover_provider if hover_provider
          @attributes[:signatureHelpProvider] = signature_help_provider if signature_help_provider
          @attributes[:declarationProvider] = declaration_provider if declaration_provider
          @attributes[:definitionProvider] = definition_provider if definition_provider
          @attributes[:typeDefinitionProvider] = type_definition_provider if type_definition_provider
          @attributes[:implementationProvider] = implementation_provider if implementation_provider
          @attributes[:referencesProvider] = references_provider if references_provider
          @attributes[:documentHighlightProvider] = document_highlight_provider if document_highlight_provider
          @attributes[:documentSymbolProvider] = document_symbol_provider if document_symbol_provider
          @attributes[:codeActionProvider] = code_action_provider if code_action_provider
          @attributes[:codeLensProvider] = code_lens_provider if code_lens_provider
          @attributes[:documentLinkProvider] = document_link_provider if document_link_provider
          @attributes[:colorProvider] = color_provider if color_provider
          @attributes[:documentFormattingProvider] = document_formatting_provider if document_formatting_provider
          @attributes[:documentRangeFormattingProvider] = document_range_formatting_provider if document_range_formatting_provider
          @attributes[:documentOnTypeFormattingProvider] = document_on_type_formatting_provider if document_on_type_formatting_provider
          @attributes[:renameProvider] = rename_provider if rename_provider
          @attributes[:foldingRangeProvider] = folding_range_provider if folding_range_provider
          @attributes[:executeCommandProvider] = execute_command_provider if execute_command_provider
          @attributes[:selectionRangeProvider] = selection_range_provider if selection_range_provider
          @attributes[:workspaceSymbolProvider] = workspace_symbol_provider if workspace_symbol_provider
          @attributes[:workspace] = workspace if workspace
          @attributes[:experimental] = experimental if experimental

          @attributes.freeze
        end

        #
        # Defines how text documents are synced. Is either a detailed structure defining each notification or
        # for backwards compatibility the TextDocumentSyncKind number. If omitted it defaults to `TextDocumentSyncKind.None`.
        #
        # @return [number | TextDocumentSyncOptions]
        def text_document_sync
          attributes.fetch(:textDocumentSync)
        end

        #
        # The server provides completion support.
        #
        # @return [CompletionOptions]
        def completion_provider
          attributes.fetch(:completionProvider)
        end

        #
        # The server provides hover support.
        #
        # @return [boolean | HoverOptions]
        def hover_provider
          attributes.fetch(:hoverProvider)
        end

        #
        # The server provides signature help support.
        #
        # @return [SignatureHelpOptions]
        def signature_help_provider
          attributes.fetch(:signatureHelpProvider)
        end

        #
        # The server provides go to declaration support.
        #
        # @return [boolean | DeclarationOptions | DeclarationRegistrationOptions]
        def declaration_provider
          attributes.fetch(:declarationProvider)
        end

        #
        # The server provides goto definition support.
        #
        # @return [boolean | DefinitionOptions]
        def definition_provider
          attributes.fetch(:definitionProvider)
        end

        #
        # The server provides goto type definition support.
        #
        # @return [boolean | TypeDefinitionOptions | TypeDefinitionRegistrationOptions]
        def type_definition_provider
          attributes.fetch(:typeDefinitionProvider)
        end

        #
        # The server provides goto implementation support.
        #
        # @return [boolean | ImplementationOptions | ImplementationRegistrationOptions]
        def implementation_provider
          attributes.fetch(:implementationProvider)
        end

        #
        # The server provides find references support.
        #
        # @return [boolean | ReferenceOptions]
        def references_provider
          attributes.fetch(:referencesProvider)
        end

        #
        # The server provides document highlight support.
        #
        # @return [boolean | DocumentHighlightOptions]
        def document_highlight_provider
          attributes.fetch(:documentHighlightProvider)
        end

        #
        # The server provides document symbol support.
        #
        # @return [boolean | DocumentSymbolOptions]
        def document_symbol_provider
          attributes.fetch(:documentSymbolProvider)
        end

        #
        # The server provides code actions. The `CodeActionOptions` return type is only
        # valid if the client signals code action literal support via the property
        # `textDocument.codeAction.codeActionLiteralSupport`.
        #
        # @return [boolean | CodeActionOptions]
        def code_action_provider
          attributes.fetch(:codeActionProvider)
        end

        #
        # The server provides code lens.
        #
        # @return [CodeLensOptions]
        def code_lens_provider
          attributes.fetch(:codeLensProvider)
        end

        #
        # The server provides document link support.
        #
        # @return [DocumentLinkOptions]
        def document_link_provider
          attributes.fetch(:documentLinkProvider)
        end

        #
        # The server provides color provider support.
        #
        # @return [boolean | DocumentColorOptions | DocumentColorRegistrationOptions]
        def color_provider
          attributes.fetch(:colorProvider)
        end

        #
        # The server provides document formatting.
        #
        # @return [boolean | DocumentFormattingOptions]
        def document_formatting_provider
          attributes.fetch(:documentFormattingProvider)
        end

        #
        # The server provides document range formatting.
        #
        # @return [boolean | DocumentRangeFormattingOptions]
        def document_range_formatting_provider
          attributes.fetch(:documentRangeFormattingProvider)
        end

        #
        # The server provides document formatting on typing.
        #
        # @return [DocumentOnTypeFormattingOptions]
        def document_on_type_formatting_provider
          attributes.fetch(:documentOnTypeFormattingProvider)
        end

        #
        # The server provides rename support. RenameOptions may only be
        # specified if the client states that it supports
        # `prepareSupport` in its initial `initialize` request.
        #
        # @return [boolean | RenameOptions]
        def rename_provider
          attributes.fetch(:renameProvider)
        end

        #
        # The server provides folding provider support.
        #
        # @return [boolean | FoldingRangeOptions | FoldingRangeRegistrationOptions]
        def folding_range_provider
          attributes.fetch(:foldingRangeProvider)
        end

        #
        # The server provides execute command support.
        #
        # @return [ExecuteCommandOptions]
        def execute_command_provider
          attributes.fetch(:executeCommandProvider)
        end

        #
        # The server provides selection range support.
        #
        # @return [boolean | SelectionRangeOptions | SelectionRangeRegistrationOptions]
        def selection_range_provider
          attributes.fetch(:selectionRangeProvider)
        end

        #
        # The server provides workspace symbol support.
        #
        # @return [boolean]
        def workspace_symbol_provider
          attributes.fetch(:workspaceSymbolProvider)
        end

        #
        # Workspace specific server capabilities
        #
        # @return [{ workspaceFolders?: WorkspaceFoldersServerCapabilities; }]
        def workspace
          attributes.fetch(:workspace)
        end

        #
        # Experimental server capabilities.
        #
        # @return [any]
        def experimental
          attributes.fetch(:experimental)
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

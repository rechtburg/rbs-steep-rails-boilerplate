module LanguageServer
  module Protocol
    module Interface
      class ExecuteCommandParams < WorkDoneProgressParams
        def initialize(work_done_token: nil, command:, arguments: nil)
          @attributes = {}

          @attributes[:workDoneToken] = work_done_token if work_done_token
          @attributes[:command] = command
          @attributes[:arguments] = arguments if arguments

          @attributes.freeze
        end

        #
        # The identifier of the actual command handler.
        #
        # @return [string]
        def command
          attributes.fetch(:command)
        end

        #
        # Arguments that the command should be invoked with.
        #
        # @return [any[]]
        def arguments
          attributes.fetch(:arguments)
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

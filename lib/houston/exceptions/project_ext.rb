module Houston
  module Exceptions
    module ProjectExt
      extend ActiveSupport::Concern

      included do
        has_adapter :ErrorTracker
      end

    end
  end
end

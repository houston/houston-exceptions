module Houston::Exceptions
  class Configuration

    def error_tracker(adapter, &block)
      raise ArgumentError, "#{adapter.inspect} is not a ErrorTracker: known ErrorTracker adapters are: #{Houston::Adapters::ErrorTracker.adapters.map { |name| ":#{name.downcase}" }.join(", ")}" unless Houston::Adapters::ErrorTracker.adapter?(adapter)
      raise ArgumentError, "error_tracker should be invoked with a block" unless block_given?

      configuration = HashDsl.hash_from_block(block)

      @error_tracker_configuration ||= {}
      @error_tracker_configuration[adapter] = configuration
    end

    def error_tracker_configuration(adapter)
      raise ArgumentError, "#{adapter.inspect} is not a ErrorTracker: known ErrorTracker adapters are: #{Houston::Adapters::ErrorTracker.adapters.map { |name| ":#{name.downcase}" }.join(", ")}" unless Houston::Adapters::ErrorTracker.adapter?(adapter)

      @error_tracker_configuration ||= {}
      @error_tracker_configuration[adapter] || {}
    end

  end
end

require "houston/exceptions/project_ext"

module Houston
  module Exceptions
    class Railtie < ::Rails::Railtie

      # The block you pass to this method will run for every request
      # in development mode, but only once in production.
      config.to_prepare do
        ::Project.send(:include, Houston::Exceptions::ProjectExt)
      end

    end
  end
end

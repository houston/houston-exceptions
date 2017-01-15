require "houston/exceptions/engine"
require "houston/exceptions/configuration"

module Houston
  module Exceptions
    extend self

    def config(&block)
      @configuration ||= Exceptions::Configuration.new
      @configuration.instance_eval(&block) if block_given?
      @configuration
    end

  end


  # Extension Points
  # ===========================================================================
  #
  # Read more about extending Houston at:
  # https://github.com/houston/houston-core/wiki/Modules


  # Register events that will be raised by this module
  #
  #    register_events {{
  #      "exceptions:create" => params("exceptions").desc("Exceptions was created"),
  #      "exceptions:update" => params("exceptions").desc("Exceptions was updated")
  #    }}


  # Add a link to Houston's global navigation
  #
  #    add_navigation_renderer :exceptions do
  #      name "Exceptions"
  #      icon "fa-thumbs-up"
  #      path { Houston::Exceptions::Engine.routes.url_helpers.exceptions_path }
  #      ability { |ability| ability.can? :read, Project }
  #    end


  # Add a link to feature that can be turned on for projects
  #
  #    add_project_feature :exceptions do
  #      name "Exceptions"
  #      icon "fa-thumbs-up"
  #      path { |project| Houston::Exceptions::Engine.routes.url_helpers.project_exceptions_path(project) }
  #      ability { |ability, project| ability.can? :read, project }
  #    end

end

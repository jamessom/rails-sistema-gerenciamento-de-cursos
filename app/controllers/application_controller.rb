class ApplicationController < ActionController::API
  def not_found
    render plain: "Not found.", status: 404
  end

  def render(options={})
    options[:json] = serializer.new(options[:json])
    super(options)
  end

  private
    def serializer
      # Should be implemented on subclasses
    end
end

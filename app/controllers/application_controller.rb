class ApplicationController < ActionController::API
  def render(options={})
    options[:json] = serializer.new(options[:json])
    super(options)
  end

  private
    def serializer;end
end

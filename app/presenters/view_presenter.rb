class ViewPresenter < Presenter

  def initialize(template, object)
    super(template)

    @object = object
  end

  def has_errors_of_type(*types)
    errors = @object.errors.reduce([]) { |array, val| array << val[1] if types.include?(val[0]) ; array }
    yield errors if errors.present?
  end

  protected #-----------------------------------protected

  def self.presents(name)
    define_method(name) do
      @object
    end
  end
end

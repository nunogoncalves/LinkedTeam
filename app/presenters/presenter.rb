class Presenter
  # extend Memoist

  def initialize(template = nil)
    @template = (template || Template.new_template)
  end

  protected #-----------------------------------protected

  def h
    @template
  end

  def translations_absolute_path(key)
    "#{h.controller_name}.#{h.action_name}#{key}"
  end

  def _t(key, options = {})
    key = key.to_s[0] == '.' ? translations_absolute_path(key) : key
    h.t(key, options)
  end

end
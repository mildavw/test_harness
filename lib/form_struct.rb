class TestHarness
  class FormStruct
    attr_accessor :browser

    def initialize(browser)
      self.browser = browser
    end

    def method_missing(name, *args, &block)
      id = name.to_s.chomp('=')
      value = args[0]
      field = browser.find_field(id)
      field[:type] =~ /^select/ ? field.select(value) : field.set(value)
    end
  end
end


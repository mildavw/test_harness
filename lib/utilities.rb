class TestHarness
  module Utilities
    module_function

    def camelize(string)
      string = string.sub(/^[a-z\d]*/) { $&.capitalize }
      string = string.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }.gsub('/', '::')
    end

    def constantize(camel_cased_word)
      names = camel_cased_word.split('::')
      names.shift if names.empty? || names.first.empty?

      constant = Object
      names.each do |name|
        constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
      end
      constant
    end

    def get_parent_class(klass)
      parent_class_name = klass.name =~ /::[^:]+\Z/ ? $`.freeze : nil
      parent_class_name ? constantize(parent_class_name) : Object
    end
  end
end

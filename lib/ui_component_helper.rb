class MissingConfiguration < Exception; end

class TestHarness
  module UIComponentHelper
    def mm
      TestHarness.mm
    end

    def component
      parent_class = TestHarness::Utilities.get_parent_class(self.class)
      parent_class ? parent_class.component : nil
    end

    def reset
      @form = nil
    end

    def configuration
      TestHarness.configuration
    end

    def browser
      @browser ||= begin
                     raise MissingConfiguration.new('TestHarness.browser must be defined') if configuration.browser.nil?
                     configuration.browser
                   end
    end

    # If the UIComponent is sent a message it does not understand, it will
    # forward that message on to its {#browser} but wrap the call in a block
    # provided to the the browser's `#within` method. This provides convenient
    # access to the browser driver's DSL, automatically scoped to this
    # component.
    def method_missing(name, *args, &block)
      if browser_respond_to?(name)
        browser.within(component.within) do
          browser.send(name, *args, &block)
        end
      else
        super
      end
    end

    # Since Kernel#select is defined, we have to override it specifically here.
    def select(*args, &block)
      browser.within(component.within) do
        browser.select(*args, &block)
      end
    end

    # We don't want to go through the method_missing above for visit, but go
    # directly to the browser object
    def visit(path)
      path = "%s:%s%s" % [server_host, server_port, path] if path !~ /^http/

      browser.visit(path)
    end

    def show!
      visit component_path
    end

    # Used to submit elements set by the *form* method
    # In the UIDriver, you can use:
    #   form.username = 'user@email.com'
    #   form.password = 'password'
    #   form.yes = true    # for checkbox
    #   form.radio1 = true # for radio button
    #
    #   submit!
    #
    def submit!
      form_hash.each do |k,v|
        field = find_field(k.to_s)
        field[:type] =~ /^select/ ? field.select(v) : field.set(v)
      end

      if has_css?(locator = component.submit)
        find(:css, component.submit).click
      else
        click_on component.submit
      end
    end

    # Used to set form elements for submittal by the method submit!
    # In the UIDriver, you can use:
    #   form.username = 'user@email.com'
    #   form.password = 'password'
    #   submit!
    def form
      @form ||= OpenStruct.new
    end

    def find_and_scroll_to(selector, opts={})
      if element = find(selector, opts)
        script = "arguments[0].scrollIntoView(true);"
        Capybara.current_session.driver.browser.execute_script(script, element.native)
      end
      element
    end

    private
    def form_hash
      form.instance_variable_get("@table")
    end

    def component_path
      case path = component.path
      when Proc then path.call(mm)
      else
        path.gsub(/:\w+/) do |match|
          token = match.tr(':', '')
          if mm.subject.is_a?(Hash) && (field_value = mm.subject.with_indifferent_access[token])
            field_value
          elsif mm.subject.respond_to? token.to_sym
            mm.subject.send(token)
          elsif mm.respond_to? token.to_sym
            mm.send(token)
          elsif mm.respond_to? token.tr('_id', '')
            mm.send(token.tr('_id', '')).id
          end
        end
      end
    end

    # @private
    # (Not really private, but YARD seemingly lacks RDoc's :nodoc tag, and the
    # semantics here don't differ from Object#respond_to?)
    def browser_respond_to?(name)
      browser.respond_to?(name)
    end

    def server_port
      Capybara.server_port || Capybara.current_session.server.try(:port)
    end

    def server_host
      host_current_session = Capybara.current_session.server.try(:host)
      configuration.server_host || host_current_session && 'http://%s' % host_current_session ||
        Capybara.default_host || 'http://example.com'
    end
  end
end

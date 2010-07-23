Then %r{^I should see (success|error) message "([^"]*)"$} do |type, message|
  type = 'notice' if type == 'success'
  within("#flash .message.#{type}") do
    if page.respond_to? :should
      page.should have_content(message)
    else
      assert page.has_content?(message)
    end
  end
end

Then %r{^I should see error fields?:? (.*)$} do |fields|
  while match = fields.match(/((.*?)"([^"]+)")/)
    xpath = '//li[contains(@class,"error")]/label[text()="%s"]' % match[3]
    fields.sub!(match[1],'')
    if page.respond_to? :should
      page.should have_xpath(xpath)
    else
      assert page.has_xpath?(xpath)
    end
  end
end


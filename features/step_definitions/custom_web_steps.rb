Given %r{^I am already signed in as "([^"]*)"$} do |someone|
  user = Factory.build(someone)
  Given "#{someone} exists" rescue nil
  And %|I go to login page|
  And %|I fill in "Username" with "#{user.login}"|
  And %|I fill in "Password" with "#{user.password}"|
  And %|I press "Login"|
end

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


Given /^I follow "([^"]*)" \/ "([^"]*)"$/ do |link1, link2|
  [link1, link2].each{|link| Given %|I follow "#{link}"| }
end

Then %r{^I should see error fields?:? (.*)$} do |fields|
  while match = fields.match(/((.*?)"([^"]+)")/)
    xpath = '//li[contains(concat(" ",@class," ")," error ")]/label[text()="%s"]' % match[3]
    fields.sub!(match[1],'')
    if page.respond_to? :should
      page.should have_xpath(xpath)
    else
      assert page.has_xpath?(xpath)
    end
  end
end

Then %r{^I should see "([^"]*)" with error "([^"]*)"$} do |field, message|
  xpath = [
    '//li[contains(concat(" ",@class," "),"error")]',
    'label[text()="%s"]' % field,
    'following-sibling::*[text()="%s"]' % message
  ].join('/')
  if page.respond_to? :should
    page.should have_xpath(xpath)
  else
    assert page.has_xpath?(xpath)
  end
end

Then %r{^I should see "([^"]*)" page$} do |title|
  Then 'I should see "%s" within "h2"' % title
end


Given %r{^I have previously voted "([^"]*)" for "([^"]*)"$} do |preference, post_title|
  Given %|I follow "#{post_title}"|
  And %|I press "#{preference}"|
end

Then %r{^I should see vote points as "([^"]*)"$} do |points|
  Then %|I should see "#{points}" within ".vote-info"|
end

Then %r{^I should see vote icon as "([^"]*)"$} do |preference|
  Then %|I should see "#{preference}" within ".vote-info .#{preference.downcase}-icon"|
end

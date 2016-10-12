Given(/^the following articles exist:$/) do |table|
  Article.create table.hashes
end

Then(/^the article "(.*?)" should have body "(.*?)"$/) do |title, body|
  Article.find_by_title(title).body.should eq body
end

Given(/^the following comments exist:$/) do |table|
  Comment.create table.hashes
end

Then(/^the comment "(.*?)" should belong to "(.*?)"$/) do |comment, article_title|
  a_id = Article.find_by_title(article_title).id
  Comment.find_by_body(comment).article_id.should eq a_id
end

Then(/^I should see merge_with$/) do
  if page.respond_to? :should
    page.should have_xpath('//input[@id="merge_with"]')
  else
    assert page.has_xpath?('//input[@id="merge_with"]')
  end
end

Then(/^I should not see merge_with$/) do
  if page.respond_to? :should
    page.should have_no_xpath('//input[@id="merge_with"]')
  else
    assert page.has_no_xpath?('//input[@id="merge_with"]')
  end
end

Then(/^I should see a helpful error message$/) do
  if page.respond_to? :should
    page.should have_css('.alert-message.error')
  else
    assert page.has_css?('.alert-message.error')
  end
end

Given(/^I am debugging$/) do
  debugger
end
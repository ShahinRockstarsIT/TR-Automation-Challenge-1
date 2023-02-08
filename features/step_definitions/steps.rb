# frozen_string_literal: true

Given(/I visit "([^"]*)"$/) do |url|
  open_browser
  open_url(url)
end

Given(/I click on the "([^"]*)" language/) do |lang|
  $browser.div(text: lang).click
end

And(/Then I start playing/) do
  9999.times do
    $browser.button(id: 'bigCookie').click
    upgrade_if_possible
  end
end

Given(/The website is loaded/) do
  wait_until_id_is_visible('bakeryName')
end

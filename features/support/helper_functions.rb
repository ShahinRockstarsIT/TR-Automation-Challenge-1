# frozen_string_literal: true

def open_browser
  $browser = if UIChallenge.firefox
               Watir::Browser.new :firefox
             elsif browser_edge
               Watir::Browser.new :edge
             elsif browser_safari
               Watir::Browser.new :safari
             else
               Watir::Browser.new :chrome
             end
end

def open_url(url)
  $browser.goto url
end

def wait_until_id_is_visible(id)
  $browser.element(id: id).wait_until(&:present?)
end

def current_scores
  text = $browser.div(id: 'cookies', class: 'title').text
  arr = text.split
  score = arr.first
  puts(score)
  score.to_i
end

def upgrade_if_possible
  return nil unless upgrade_enabled

  score = current_scores
  cost = upgrade_costs
  return nil unless score > cost

  products = $browser.divs(class: 'product unlocked enabled')
  products.first.click
end

def upgrade_enabled
  $browser.div(class: 'product unlocked enabled').exists?
end

def upgrade_costs
  products = $browser.divs(class: 'product unlocked enabled')
  cursor = products.first
  cost = cursor.span(class: 'price').text
  cost.to_i
end

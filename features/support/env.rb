# frozen_string_literal: true

require 'rspec/expectations'
require 'cucumber'
require 'watir'
require 'json'
require 'fileutils'
require 'webdrivers'

class UIChallenge
  def self.firefox
    ENV['BROWSER'] == 'firefox'
  end

  def self.chrome
    ENV['BROWSER'] == 'chrome'
  end

  def self.safari
    ENV['BROWSER'] == 'safari'
  end

  def self.edge
    ENV['BROWSER'] == 'edge'
  end
end

After do |_scenario|
  $browser.close
end

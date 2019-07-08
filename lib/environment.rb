require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'terminal-table'


module MyCliProject
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./cli"
require_relative "./player"
require_relative "./scraper"
require_relative "./my_cli_project/version"
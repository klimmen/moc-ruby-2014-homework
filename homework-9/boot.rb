require 'rubygems'
require "sinatra"
require 'nokogiri'
require 'open-uri'

Dir[File.dirname(__FILE__) + '/app/*.rb'].each {|file| require file }


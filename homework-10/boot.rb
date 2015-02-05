require 'bundler/setup'
Bundler.require(:default)

require 'rubygems'
require "sinatra"
require 'nokogiri'
require 'open-uri'
require "sinatra/activerecord"
require "./models"


Dir[File.dirname(__FILE__) + '/app/*.rb'].each {|file| require file }


$:.unshift File.expand_path("../", __FILE__)
require 'rubygems'
require 'sinatra'
require './app.rb'
run Sinatra::Application

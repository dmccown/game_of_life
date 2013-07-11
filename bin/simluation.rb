#!/usr/bin/env ruby

lib = File.expand_path(File.dirname(__FILE__) + '/../lib')
$LOAD_PATH.unshift(lib) if File.directory?(lib) && !$LOAD_PATH.include?(lib)

require 'board'
require 'cell'
require 'game_of_life'

args = ARGV.dup
ARGV.clear

system('clear')

GameOfLife.run(args) do | output, index |
  puts "#{index}"
  puts output
  sleep 0.3
  system('clear')
end

#!/usr/bin/env ruby

lib = File.expand_path(File.dirname(__FILE__) + '/../lib')
$LOAD_PATH.unshift(lib) if File.directory?(lib) && !$LOAD_PATH.include?(lib)

require 'board'
require 'cell'
require 'game_of_life'

args = ARGV.dup
ARGV.clear

system('clear')

GameOfLife.run(args[0].to_i, args[1].to_i, args[2].to_f, args[3].to_i) do | output, index |
  puts output
  sleep 0.1
  system('clear')
end

#!/usr/bin/env ruby

$: << File.dirname(__FILE__)
$oj_dir = File.dirname(File.expand_path(File.dirname(__FILE__)))
%w(lib ext).each do |dir|
  $: << File.join($oj_dir, dir)
end

require 'oj'

class Foo
  def initialize
    @x = 123
  end

  def xto_json(opt=nil, options=nil)
    "---to_json---"
  end
end

class Bar < Foo
  def initialize
    @x = 321
  end
end

foo = Foo.new
bar = Bar.new

require 'json'

puts "JSON: #{JSON.generate(foo)}"
puts "to_json: #{foo.to_json}"
puts "bar JSON: #{JSON.generate(bar)}"
puts "bar to_json: #{bar.to_json}"

m = bar.method('to_json')
puts "*** method: #{m} owner: #{m.owner.name}"

puts "---- rails"
require 'rails'

m = bar.method('to_json')
puts "*** method: #{m} owner: #{m.owner} params: #{m.parameters}"

puts "JSON: #{JSON.generate(foo)}"
puts "to_json: #{foo.to_json}"

puts "---- Oj.mimic_JSON"
Oj.mimic_JSON()
puts "Oj JSON: #{JSON.generate(foo)}"
puts "Oj to_json: #{foo.to_json}"

m = bar.method('to_json')
puts "*** method: #{m} owner: #{m.owner} params: #{m.parameters}"

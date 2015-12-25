#!/usr/bin/env ruby

def nat_ord s
  s.split(/(\d+)|(\D+)/).select {|c| c != ''}.map do |c|
    x = c.to_i
    x > 0 || c[0] == '0' ? x : c
  end
end

class Fixnum
  alias :old_cmp :<=>
  def <=> a
    case a
      when Fixnum then old_cmp a
      when String then -1
    end
  end
end

class String
  alias :old_cmp :<=>
  def <=> a
    case a
      when String then old_cmp a
      when Fixnum then 1
    end
  end
end

if __FILE__ == $0
  exit if ARGV.length < 1

  dir = File.dirname ARGV.first
  file = File.basename ARGV.first

  Dir.chdir dir
  all = Dir.entries('.').select do |f|
    f =~ /\.(jpe?g|png|bmp|gif)$/i
  end.sort_by {|f| nat_ord f}

  exec 'feh', '--start-at', file, '-F', '-Y', *all
end

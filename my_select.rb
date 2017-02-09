require_relative 'my_each'
require 'pry'

class Array
  def my_select(proc = nil, &block)
    new_arr = []
    if block_given?
      self.my_each do |x|
         if block.call(x)
           new_arr << x
         end
      end
      puts new_arr
    else
      self.my_each do |x|
        if proc.call(x)
          new_arr << x
        end
      end
      puts new_arr
    end
  end
end

my_proc = Proc.new{|item| item.even?}

[1,2,5].my_select(my_proc)
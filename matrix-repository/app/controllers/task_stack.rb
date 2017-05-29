require 'singleton'

class TaskStack
  include Singleton

  def initialize
    @tasks = Array.new
  end

  def put(index, content)
    @tasks.push(index: index, content: content)
  end

  def get(index)
    # tasks array the element
    puts "Size of stack is #{@tasks}"

    puts "Request index #{index}"

    hash = @tasks.select { |element| element[:index] == index }

    puts "return hash length #{hash}"

    return hash
  end
end

require 'singleton'

class TaskStack
  include Singleton

  def initialize
    @tasks = Array.new
    @mutex = Mutex.new
  end

  def put(index, content)
    @mutex.synchronize do
      @tasks.push(index: index, content: content)
    end
  end

  def get(index)
    # tasks array the element
    puts "Size of stack is #{@tasks.length}"
    puts "Request index #{index}"

    hash = @tasks.select { |element| element[:index] == index }

    return hash
  end

  def all
    @tasks
  end

  def pop
    hash = nil

    @mutex.synchronize do
      index = @tasks.last[:index]
      hash = get(index)
      puts "pop elements with index #{index}"
      @tasks.delete_if { |element| element[:index] == index }
    end

    return hash
  end

  def clear
    @tasks = Array.new
  end

end

require 'singleton'

class TaskStack
  include Singleton

  def initialize
    # have all tasks
    @tasks = Array.new
    @mutex = Mutex.new
  end

  def put(index, content)
    @mutex.synchronize do
      @tasks.push(index: index, content: content)
    end
  end

  def get(key)
    # tasks array the element
    puts "Size of stack is #{@tasks.length}"
    puts "Request key #{key}"

    a_index = key.split('x')[0]
    b_index = key.split('x')[1]

    select_a = @tasks.detect {|element| element[:index] == 'A' + a_index}
    select_b = @tasks.detect {|element| element[:index] == 'B' + b_index}

    puts [select_a, select_b]

    return [select_a, select_b]
  end

  def pop(key)
    array = nil

    @mutex.synchronize do
      array = get(key)

      unless array.all?{ |x| x.nil? }
        puts "pop elements with key #{key}"
        @tasks.delete_at(@tasks.find_index(array.first))
        @tasks.delete_at(@tasks.find_index(array.last))
      else
        puts "some element is not in repository"
      end
    end

    return array
  end

  def all
    @tasks
  end

  def clear
    @tasks = Array.new
  end

  private

  def get_numeric_index(str)
    str.delete('^0-9')
  end

end

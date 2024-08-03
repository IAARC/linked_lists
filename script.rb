require 'pry-byebug'

class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value=nil)
    @value = value
    @next = nil
  end

  def next_node(node)
    @next = node
  end
end

class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def new_node(value)
    Node.new(value)
  end

  def append(value)
    node = new_node(value)
    if @head.nil?
      @head = node
    elsif @tail.nil?
      @head.next = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def prepend(value)
    node = new_node(value)
    if @head.nil?
      @head = node
    elsif @tail.nil?
      @tail = @head
      @head = node
      @head.next = @tail
    else
      node.next = @head
      @head = node
    end
  end

  def size
    i = 0
    current_node = @head
    until current_node.nil?
      i += 1
      current_node = current_node.next
    end
    i
  end

  def at(index)
    return nil if index > size
    current_node = @head
    index.times do
      current_node = current_node.next
    end
    current_node
  end

  def pop
    n = self.size
    @tail = nil
    self.at(n-2).next = nil
    @tail = self.at(n-2)
  end

  def contains?(value)
    0.upto(self.size) do |i|
      return false if self.at(i).nil?
      return true if value == self.at(i).value
    end
  end

  def find(value)
    0.upto(self.size) do |i|
      return nil if self.at(i).nil?
      return i if value == self.at(i).value
    end
  end

  def to_s
    string = "( #{@head.value} )"
    1.upto((self.size) - 1) do |i|
      string << " -> ( #{self.at(i).value} )"
    end
    string << ' -> nil'
  end
end

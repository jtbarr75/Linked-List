class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  #Appends value to the end of the Linked List
  def append(value)
    node = Node.new(value)
    if @head == nil
      @head, @tail = node, node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  #Prepends value to the beginning of the Linked List
  def prepend(value)
    node = Node.new(value)
    if @head == nil
      @head, @tail = node, node
    else
      node.next_node = @head
      @head = node
    end
  end

  #Returns the number of nodes in the list
  def size
    return 0 if @head == nil
    count = 1
    cur = @head
    until cur == @tail
      cur = cur.next_node
      count += 1
    end
    count
  end

  #Returns the first node
  def head
    @head.value
  end

  #returns the last node
  def tail
    @tail.value
  end

  #Returns the node at index
  def at(index)
    return nil if index.abs > self.size
    cur = @head
    if index >= 0
      index.times { cur = cur.next_node }
    else
      (self.size + index).times { cur = cur.next_node }
    end
    cur
  end

  #Removes the last node from the list, returns it
  def pop
    popped_node = @tail
    @tail = self.at(self.size-2)
    @tail.next_node = nil
    popped_node
  end

  #returns true if the list contains value
  def contains?(value)
    cur = @head
    until cur == nil
      return true if cur.value == value
      cur = cur.next_node
    end
    false
  end

  #returns the index of the given value
  def find(value)
    index = 0
    cur = @head
    until  cur == nil
      return index if cur.value == value
      cur = cur.next_node
      index += 1
    end
    nil
  end

  #Formats the Linked List as ( Node 1 value ) -> ( Node 2 value ) ...
  def to_s
    cur = @head
    str = ""
    while cur
      str << "( #{cur.value} ) -> "
      cur = cur.next_node
    end
    str << "nil"
  end

  #Inserts the value at a given index
  def insert_at(value, index)
    raise "index out of bounds" if index >= self.size
    node = Node.new(value)
    @head = node if index == 0
    node.next_node = self.at(index).next_node
    self.at(index).next_node = node
    @tail = node if node.next_node.nil?
    node
  end

  #Removes the value at the given index
  def remove_at(index)
    raise "index out of bounds" if index >= self.size
    if index == 0
      @head = @head.next_node
    else
      prev_node = self.at(index - 1)
      prev_node.next_node = self.at(index).next_node
      @tail = prev_node if prev_node.next_node.nil?
    end
  end
  
end

list = LinkedList.new
list.prepend(2)
list.prepend(1)
list.append(3)
puts list
list.append(4)
puts list
# puts list.size
# puts list.head
# puts list.tail
puts list.at(2)
puts list.pop
puts list
# puts list.contains? 3
# puts list.contains? 5
puts list.find(1)
list.insert_at(4,2)
puts list
list.remove_at(2)
puts list
puts list.at(-1)

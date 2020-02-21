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
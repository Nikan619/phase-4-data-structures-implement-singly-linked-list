require_relative './node'

class LinkedList

    attr_reader :head,:tail
    def initialize
        @head = nil
        @tail = nil
    end

    def prepend(node)
        if @head.nil?
            @head = node
            @tail = node
        else 
            node.next = @head
            @head = node
        end
    end

    def append(node)
        if @tail.nil?
            @head = node
            @tail = node
        else 
            @tail.next = node
            @tail = node
        end
    end

    def delete_head
        return if @head.nil?
        @head = @head.next 
        @tail = nil if @head.nil?
    end

    def delete_tail
        return if @tail.nil?
        current_node = @head
        while current_node.next != @tail
            current_node = current_node.next
        end
        current_node.next = nil
        @tail = current_node
    end

    def add_after(index,node)
        current_node = @head
        current_index = 0 
        while current_index < index && current_node
            current_node = current_node.next
            current_index +=1
        end
        return unless current_node
        node.next = current_node.next
        current_node.next = node
    end 
    def search(value)
        current_node = @head
        while current_node
            return current_node if current_node.value == value
            current_node = current_node.next 
        end
        nil
    end
end


end

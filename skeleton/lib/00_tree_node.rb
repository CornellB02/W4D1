class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value 
        @parent = nil
        @children = []
    end

    def parent=(node1)
        self.parent.children.delete(self) if @parent != nil
        @parent = node1 
        if node1 != nil && !node1.children.include?(self) 
            node1.children << self
        end

    end

    def add_child(node)
        node.parent=(self)

    end
      
    def remove_child(node)
        node.parent=(nil)
        raise if !self.children.include?(node)
    end   

    def dfs(target)
        return self if self.value == target 
        return nil if self.children.empty?

        self.children.each do |child|
            call = child.dfs(target)
            if !call.nil?
                return call
            end
        end
        nil
    end

    def bfs(target)
        arr = [self]

        return self if @value == target 
        self.children.each do |child|
            
        end
    end


end
require "pry"

COLORS = [:red, :green]


def possible_bipartition(dislikes)
  painted_graph = {}
  current_color = 0
  dislikes.each_with_index do |neighbors, node|
    if !painted_graph[node]
      painted_graph[node] = COLORS[current_color]
      unless dfs(dislikes, node, painted_graph, current_color)
        return false
      end
    end
  end

  return true
end

def dfs(dislikes, current_node, painted_graph, current_color)

  neighbors = dislikes[current_node]
  next_color = (current_color + 1) % COLORS.length

  neighbors.each do |neighbor|
    color = painted_graph[neighbor]
    # if it's not visited yet
    if color.nil?
      painted_graph[neighbor] = COLORS[next_color]
      if !dfs(dislikes, neighbor, painted_graph, next_color)
        return false
      end
    # if there's a color and it's the wrong one
    elsif color != COLORS[next_color]
      return false      
    end
  end
  
  # If you've successfully made a DFS on each node
  return true
end
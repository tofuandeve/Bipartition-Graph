
def possible_bipartition(dislikes)
  total_size = dislikes.length()
  if total_size > 0
    q = Array.new()
    marked = Hash.new()
    marked_size = 0
    q.push([marked_size, true])

    while !q.empty?
      current = q.pop()
      puppy = current.first
      color = current.last

      if marked[puppy] == nil
        marked[puppy] = color
        marked_size += 1
      elsif marked[puppy] != color
        return false
      end

      dislikes[puppy].each do |connection|
        if marked[connection] == nil
          q.push([connection, !color])
        elsif marked[connection] == color
          return false
        end
      end

      q.push([marked_size, true]) if q.empty? && (marked_size < total_size)
    end
  end
  return true
end

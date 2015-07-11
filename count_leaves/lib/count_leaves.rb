class CountLeaves
  def count_leaves c
    if c.is_a? Array
      count_array c
    elsif c.is_a? Hash
      count_hash c
    else
      1
    end
  end

  private

  def count_array c
    return 0 if c == []
    #TODO finish
    first = c.shift
    if first.is_a? Array || first.is_a? Hash
      count_leaves(first) + count_leaves(c)
    else
      1 + count_leaves(c)
  end

  def count_hash c
    return 0 if c == {}
    #TODO finish
    count_leaves
  end
end

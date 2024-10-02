module Enumerable
  def my_each_with_index
    index = 0
    self.my_each do |item|
      yield(item, index)
      index += 1
    end
  end

  def my_select
    result = []
    self.my_each do |item|
      result << item if yield(item)
    end
    result
  end

  def my_all?
    self.my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    self.my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_count
    count = 0
    self.my_each do |item|
      count += 1 if !block_given? || yield(item)
    end
    count
  end

  def my_map
    result = []
    self.my_each do |item|
      result << yield(item)
    end
    result
  end

  def my_inject(initial = nil)
    acc = initial ? initial : self.first
    self.my_each do |item|
      acc = yield(acc, item)
    end
    acc
  end
end

class Array
  def my_each
    for item in self
      yield(item)
    end
  end
end

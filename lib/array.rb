# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

  def span
    if self.empty?
      nil 
    else
      self.max-self.min
    end
  end

  def average
    if self.empty?
      nil
    else
      self.sum/(self.length*1.0)
    end
  end

  def median
    if self.empty?
       return nil   
    end

    sorted=self.sort
    length=self.length
    if length%2 != 0
      sorted[length/2]
    else
      (sorted[length/2-1]+sorted[length/2])/2.0
    end
  end

  def counts
    counts=Hash.new(0)
    self.each {|ele| counts[ele]+=1}
    counts
  end

  def my_count(val)
    counter=0
    self.each {|ele| counter+=1 if ele==val}
    counter
  end

  def my_index(val)
    return nil if !self.include?(val)
    self.each_with_index {|ele,i| return i if ele==val}
  end

  def my_uniq
    new_arr=[]
    self.each {|ele| new_arr<<ele if !new_arr.include?(ele)}
    new_arr
  end

  def my_transpose
    new_arr=[]
    n=self.length
    (0...n).each do |col|
      new_row=[]
      (0...n).each do |row|
         new_row<<self[row][col]
      end
      new_arr<<new_row
    end
    new_arr
  end
end

class Board
  attr_accessor :col1, :col2, :col3, :col4, 
                :col5, :col6, :col7

  def initialize
    (1..7).each { |num| instance_variable_set("@col#{num}", Array.new(6, '-')) }
  end

  def add_to_board(column, disc)
    column.each_with_index do |slot, ind|
      if slot == "-"
        column[ind] = disc
        break
      end
    end   
    column 
  end

  def return_board
    instance_variables
  end

  def display_board  
  end

end
class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, ' ')
  end

  def reset!
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(num)
    @cells[num.to_i - 1]
    #returns " ", "X", or "O"
  end

  def full?
    @cells.none? {|cell| cell == " "}
  end

  def turn_count
    @cells.count {|x| x != " "}
  end

  def taken?(cell)
    @cells[(cell.to_i - 1)] != " "
  end

  def valid_move?(cell)
    #code smell, but passes tests
    cell.to_i.is_a?(Integer) && cell.to_i.between?(1, 9) && !taken?(cell)
  end

  def update(cell, player)
    #assigns cell to player token
    #was getting #<Double "player"> error, but saw issue
    @cells[cell.to_i - 1] = player.token
  end


end

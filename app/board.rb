# frozen_string_literal: true

class Board
  MAX_INDEX = 2
  EMPTY = ' '
  COL_NUM = { 'A' => 0, 'B' => 1, 'C' => 2 }.freeze

  # create a 3 * 3 empty array
  def initialize(current_player)
    @current_player = current_player
    @board = Array.new(MAX_INDEX + 1) { Array.new(MAX_INDEX + 1) { EMPTY } }
  end

  # print the board grid
  def display
    puts
    puts '   A   B   C'
    puts "1  #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
    puts '  ---|---|---'
    puts "2  #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
    puts '  ---|---|---'
    puts "3  #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
    puts
  end

  # ask a player for desired position
  def player_move(current_player)
    played = false
    until played
      puts 'Player ' + current_player + ': Where would you like to play?'
      player_choice = gets.chomp.upcase
      row = player_choice[0].to_i - 1
      col = COL_NUM[player_choice[1]]
      if validate_position(row, col)
        @board[row][col] = current_player
        played = true
      end
    end
  end

  def next_turn(current_player)
    current_player == 'X' ? 'O' : 'X'
  end

  # check if board is full
  def full_board?
    (0..MAX_INDEX).each do |row|
      (0..MAX_INDEX).each do |col|
        return false if @board[row][col] == EMPTY
      end
    end
    true
  end

  # check if given position is valid
  def validate_position(row, col)
    if row > MAX_INDEX || col > MAX_INDEX
      puts 'Invalid position.'
    elsif @board[row][col] != EMPTY
      puts 'That position is occupied'
    else
      true
    end
  end

  # check if same symbol exists in a full row
  def winning_row
    (0..MAX_INDEX).each do |row|
      symbol = @board[row][0]
      next if symbol == EMPTY
      (1..MAX_INDEX).each do |col|
        break unless symbol == @board[row][col]
        return symbol if col == MAX_INDEX
      end
    end
    nil
  end

  # check if same symbol exists in a full column
  def winning_col
    (0..MAX_INDEX).each do |col|
      symbol = @board[0][col]
      next if symbol == EMPTY
      (1..MAX_INDEX).each do |row|
        break unless symbol == @board[row][col]
        return symbol if row == MAX_INDEX
      end
    end
    nil
  end

  # check if same symbol exists in a diagonal
  def winning_diagonal
    symbol = @board[0][0]
    unless symbol == EMPTY
      (1..MAX_INDEX).each do |index|
        break unless symbol == @board[index][index]
        return symbol if index == MAX_INDEX
      end
    end
    symbol = @board[0][MAX_INDEX]
    unless symbol == EMPTY
      row_index = 0
      col_index = MAX_INDEX
      while row_index < MAX_INDEX
        row_index += 1
        col_index -= 1
        break unless symbol == @board[row_index][col_index]
        return symbol if row_index == MAX_INDEX
      end
    end
    nil
  end

  def winner
    winning_row || winning_col || winning_diagonal
  end
end

class ConnectFour
	attr_accessor :playe1, :player2, :board

	def initialize(player1, player2)
		@players = [player1, player2]
		@turn = 0
		@board = [Array.new(7), Array.new(7), Array.new(7), Array.new(7), Array.new(7), Array.new(7)]
	end
	
	def show_board
		@board.reverse.each { |row| print "#{row}" + "\n" }#Array is reversed to display @board[0] at the bottom in console.

		if winner_yet? == true
			@turn == 0 ? @turn = 1 : @turn = 0
			puts "#{@players[@turn].name} WINS!"
		else
			interface
		end
	end

	def interface
		begin
		print "It's #{@players[@turn].name}'s turn, choose a column (0 to 6): "
		disc_in_column = Integer(gets)
		end until (0..6).include?(disc_in_column)
		add_disc(@players[@turn].disc, disc_in_column)
		show_board
	end

	def add_disc(disc, column)
		if check_full(column) == true
			puts "Can't place there, column is filled!"
		else
			@board.each { |row|
				if row[column].nil?
					row[column] = disc
					break
				end 
			}
			@turn == 0 ? @turn = 1 : @turn = 0
		end
	end

	def check_full(place)
		if @board[5].all? == true
			return "We have a DRAW!"
		elsif @board[5][place].nil?
			return false
		else
			return true
		end
	end

	def winner_yet?
		@board.reverse.each_with_index { |row, i|

			row.each_with_index { |slot, column|
				unless slot.nil?
					return true if row[column..column+3].all? { |x| x == slot } && column < 5 #Checks if 4 of the same discs are in the same row or Array sequentially.
					count = 0
					@board.each_with_index { |x, dex| #Iterates through each nested array of @board and keeps track if 4 of the same discs are sequentially in the same index(column).
						if x[column] == slot
							count += 1
							return true if count == 4 || diagonal_win?(x[column], dex, column)
						else
							count = 0 
						end }
				end }
		 }
		return false
	end
	def diagonal_win?(disc, row, column) 
		count = 1 #starts in one from winner_yet? function.

		if row < 3 #if the row is less than 3 it can only be diagonal win if it goes upwards[adding].
			while @board[row + 1][column + 1] == disc
				count += 1
				row += 1
				column += 1
				return true if count == 4
			end
		else
			while @board[row - 1][column + 1] == disc
				count += 1
				row -= 1
				column += 1
				return true if count == 4
			end
		end
		return false
	end

end

class Player
	attr_reader :name, :disc
	def initialize(name, disc)
		@name = name
		@disc = disc
	end
end












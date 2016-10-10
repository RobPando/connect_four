require_relative 'connect_four.rb'

puts "Welcome to 'Connect Four' game!"
print "Name of player1?: "
name1 = gets.strip
begin
print "\nChoose your disc [1]-> ☻ [2]-> ☺ :"
choice = Integer(gets)
end until (1..2).include?(choice)
if choice == 1
	disc1 = "☻"
	disc2 = "☺"
else
	disc2 = "☻"
	disc1 = "☺"
end
print "Name of player2?: "
name2 = gets.strip

player1 = Player.new(name1, disc1)
player2 = Player.new(name2, disc2)
game = ConnectFour.new(player1, player2)
game.show_board
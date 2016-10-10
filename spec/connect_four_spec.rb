require 'connect_four'

describe ConnectFour do 

	describe "Player" do
		let(:player1) { Player.new("Rob", "☺") }
		let(:player2) { Player.new("Bryan", "☻") }

		context "calling player1 name and disc returns 'Rob' and '☺'" do
			it { expect(player1.name).to eql("Rob") }
			it { expect(player1.disc).to eql("☺") }
		end
	end

let(:new_game) { ConnectFour.new(Player.new("Rob", "☺"), Player.new("Bryan", "☻")) }
	context "When game is created, creates blank board" do
		it { expect(new_game.board).to eql([[nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil]]) }
	end

	describe "#add_disc" do
		before do
			new_game.add_disc("☺", 1)
		end
		it { expect(new_game.board[0]).to eql([nil, "☺", nil, nil, nil, nil, nil])}
	end

	describe "#check_full" do
		context "Returns true if a column is filled" do
			before do
				6.times do
					new_game.add_disc("☺", 0)
				end
			end
			it {expect(new_game.check_full(0)).to be true }
		end
		context "Returns 'draw' if the board is filled" do
			before do 
				6.times do
					new_game.add_disc("☺", 0)
					new_game.add_disc("☺", 1)
					new_game.add_disc("☺", 2)
					new_game.add_disc("☺", 3)
					new_game.add_disc("☺", 4)
					new_game.add_disc("☺", 5)
					new_game.add_disc("☺", 6)
				end
			end
			it { expect(new_game.check_full(0)).to eql("We have a DRAW!") }
		end
	end
	describe "#winner_yet?" do
		context "Will return true if four discs alike are in a row" do
			before do 
				new_game.add_disc("☺", 0)
				new_game.add_disc("☺", 1)
				new_game.add_disc("☺", 2)
				new_game.add_disc("☺", 3)
			end
			it { expect(new_game.winner_yet?).to be true }
		end
		context "Will return true if four discs alike are in a column" do
			before do 
				4.times do
					new_game.add_disc("☺", 4)
				end
			end
				it { expect(new_game.winner_yet?).to be true }
		end
		context "Will return true if four discs alike are diagnollay" do
			before do
				new_game.add_disc("☺", 0)
				new_game.add_disc("☻", 1)
				new_game.add_disc("☺", 1)
				2.times{ new_game.add_disc("☻", 2) }
				new_game.add_disc("☺", 2)
				3.times{ new_game.add_disc("☻", 3) }
				new_game.add_disc("☺", 3)
			end
			it { expect(new_game.winner_yet?).to be true }
		end
	end 
end

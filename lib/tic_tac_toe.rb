

class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [2, 4, 6], [0, 4, 8]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        index >= 0 && index <= 8 && !position_taken?(index)
    end

    def turn_count
        @board.count { |position| position != " " }
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            token = current_player
            move(index, token)
        else turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            if @board[combo[0]] == @board[combo[1]] &&
                @board[combo[1]] == @board[combo[2]] &&
                position_taken?(combo[0])
                return combo
            end
        end
    end

    def full?
        @board.all? do |index|
            index != " "
        end
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        won? ? @board[won?[0]] : nil
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end










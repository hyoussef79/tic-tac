# frozen_string_literal: true

require 'stringio'

describe Board do
  subject { Board.new('X') }

  describe '#initialize' do
    it 'should assign @board' do
      board = subject.instance_variable_get('@board')
      expect(board).to be_instance_of Array
    end

    it 'should assign @current_player' do
      current_player = subject.instance_variable_get('@current_player')
      expect(current_player).to eq('X')
    end
  end

  describe '#next_turn' do
    it 'should return the other player' do
      expect(subject.next_turn('X')).to eq 'O'
      expect(subject.next_turn('O')).to eq 'X'
    end
  end

  describe '#player_move' do
    before do
      $stdin = StringIO.new('1A')
    end

    after do
      $stdin = STDIN
    end

    it 'should insert X or O in the correct position' do
      board = subject.instance_variable_get('@board')
      subject.player_move('X')
      expect(board[0][0]).to eq 'X'
    end
  end
end

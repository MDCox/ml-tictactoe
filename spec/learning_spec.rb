require 'rspec'
require 'learning'

describe "rand_move" do
  it "randomly plays a move based on the passed in board position" do
    %w(O00 0O0 00O).include?(rand_move("000")).should(eq(true))
  end
  it "only plays the move on an empty space" do
    rand_move("0XO").should(eq("OXO"))
  end
  it "accepts a full board position" do
    board = rand_move("00X0OXOX0")
    %w(O0X0OXOX0 0OX0OXOX0 00XOOXOX0 00X0OXOXO).include?(board).should(eq(true))
  end
end
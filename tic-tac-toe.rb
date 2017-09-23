# 要畫出只有九格的棋盤
def display_board(board)
  puts
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "___________"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "___________"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts
end

my_board = [ " ", " ", " ", " ", " ", " ", " ", " ", " " ]
display_board(my_board)
# 使用者能輸入棋步
# 已經下過的格子不能再選

def key_in(board, o_or_x)
  print "Please key in "+ o_or_x + " location: "
  str_pos = gets
  int_pos = Integer(str_pos)
  if board[int_pos] == " "
    board[int_pos] = o_or_x
  else
    key_in(board, o_or_x)
  end
end

sbwin = 0

for i in 0..8
  # 輪到第一位玩家下棋，放入 O 
  if i % 2 == 0
    key_in(my_board, "o")
    display_board(my_board)
    # 達成一直線時，遊戲結束，該玩家得勝
    if (my_board[0] == my_board[1] && my_board[1] == my_board[2]) && my_board[2] != " " || (my_board[3] == my_board[4] && my_board[4] == my_board[5]) && my_board[5] != " " || (my_board[6] == my_board[7] && my_board[7] == my_board[8]) && my_board[8] != " " || (my_board[0] == my_board[3] && my_board[3] == my_board[6]) && my_board[6] != " " || (my_board[1] == my_board[4] && my_board[4] == my_board[7]) && my_board[7] != " " || (my_board[2] == my_board[5] && my_board[5] == my_board[8]) && my_board[8] != " " || (my_board[0] == my_board[4] && my_board[4] == my_board[8]) && my_board[8] != " " || (my_board[2] == my_board[4] && my_board[4] == my_board[6]) && my_board[6] != " "
      puts "o win"
      sbwin = 1
      break
    else
      i += 1
    end
  # 輸到第二位玩家下棋，放入 X
  else
    key_in(my_board, "x")
    display_board(my_board)
    if (my_board[0] == my_board[1] && my_board[1] == my_board[2]) && my_board[2] != " " || (my_board[3] == my_board[4] && my_board[4] == my_board[5]) && my_board[5] != " " || (my_board[6] == my_board[7] && my_board[7] == my_board[8]) && my_board[8] != " " || (my_board[0] == my_board[3] && my_board[3] == my_board[6]) && my_board[6] != " " || (my_board[1] == my_board[4] && my_board[4] == my_board[7]) && my_board[7] != " " || (my_board[2] == my_board[5] && my_board[5] == my_board[8]) && my_board[8] != " " || (my_board[0] == my_board[4] && my_board[4] == my_board[8]) && my_board[8] != " " || (my_board[2] == my_board[4] && my_board[4] == my_board[6]) && my_board[6] != " "
      puts "x win"
      sbwin = 1
      break
    else
      i += 1
    end
  end
end

# 所有格子被填滿 平手
if sbwin == 0
  puts "fair!"
end
# 達成一直線時，遊戲結束，該玩家得勝


# 在棋盤上印出棋盤
def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# 把棋步存進棋盤
# 印出有新棋步的棋盤
def play(board, count)
    if current_player(count) == "X"
        puts "請選出你要下棋的位置"
        input = gets.chomp
        position = input.to_i - 1
        if(valid_move?(position, board))
            board[position] = current_player(count)
            display_board(board)
            else
            play(board, count)
        end
        else
        puts "換電腦下棋"
        position = computer_play(board)
        board[position] = current_player(count)
        display_board(board)
    end
end

# 兩人輪流下棋
# 限制回合數
# 回合數不超過 9 次時，重覆呼叫「玩家下棋」的執行程序

def turn(board)
    count = 1
    while count <= 9
        puts "第 #{count} 回合，輪到 #{current_player(count)}"
        play(board, count)
        if(won?(board))
            puts "#{current_player(count)} win!"
            break
        end
        count += 1
    end
end

# 計算回合數
# 根據回合數，印出「X」或「O」

def current_player(count)
    if count % 2 == 0
        return "O"
        else
        return "X"
    end
end

def won?(board)
    if (board[0] == board[1] && board[1] == board[2]) && board[2] != " " || (board[3] == board[4] && board[4] == board[5]) && board[5] != " " || (board[6] == board[7] && board[7] == board[8]) && board[8] != " " || (board[0] == board[3] && board[3] == board[6]) && board[6] != " " || (board[1] == board[4] && board[4] == board[7]) && board[7] != " " || (board[2] == board[5] && board[5] == board[8]) && board[8] != " " || (board[0] == board[4] && board[4] == board[8]) && board[8] != " " || (board[2] == board[4] && board[4] == board[6]) && board[6] != " "
        return true
    end
end

# 輸入的內容是介於 1 到 9 的數字
# 選擇的棋盤位置是空的

def valid_move?(position, board)
    position >= 0 && position <= 8 && board[position] == " "
end

# 限定選擇棋盤空格
def avail_position(board)
    # 在這裡宣告你的容器
    space = Array.new
    for position in 0..8
        # 在這裡撰寫篩選空格的流程
        if board[position] == " "
            space.push(position)
        end
    end
    return space
end

def computer_play(board)
    return avail_position(board).sample
end

###################################################
# 執行程序

puts "你開啟了一局新的井字遊戲！"
puts "請以 1-9 數字對應棋盤位置"
display_board([1,2,3,4,5,6,7,8,9])
board = Array.new(9, " ")
turn(board)

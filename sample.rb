class Player
  # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
  def hand
    puts "数字を入力してください。"
    puts "0: グー"
    puts "1: チョキ"
    puts "2: パー"
    input_hand = gets
    #puts input_hand.class #確認用
    #puts input_hand #入力された文字確認用

    if input_hand == "0\n" || input_hand == "1\n" || input_hand == "2\n"
      player_hand = input_hand.to_i
      jankenhands = ["グー","チョキ","パー"]
      puts "あなたは#{jankenhands[player_hand]}を選びました"
      return player_hand
    else
      puts "無効な値です。"
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      janken.pon(player.hand, enemy.hand)
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemy_hand = rand(0..2)

    if (enemy_hand == 0)
      return enemy_hand

    elsif (enemy_hand == 1)
      return enemy_hand

    else (enemy_hand == 2)
      return enemy_hand
    end
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    judge = (player_hand - enemy_hand + 3)%3
    jankenhands = ["グー","チョキ","パー"]

    if judge == 1
      puts "相手は#{jankenhands[enemy_hand]}を選びました！　あなたの負けです！"

    elsif judge == 0
        puts "相手も#{jankenhands[enemy_hand]}を選びました！　あいこです！　もう１度数字を入力してください！"
        player = Player.new
        enemy = Enemy.new
        janken = Janken.new
        janken.pon(player.hand, enemy.hand)

    else
      puts "相手は#{jankenhands[enemy_hand]}を選びました！　あなたの勝ちです！"
    end
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)

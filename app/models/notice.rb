class Notice < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  enum plan_id: { birthday: 0, meet_friend: 1, neglect_friend: 2 }

  belongs_to :friend
  belongs_to :user

  def birthday?
    friend.birthday.strftime("%m-%d") == Date.current.strftime("%m-%d")
  end

  def meet_friend?(current_user)
    # 今日の日付取得
    today = Date.today
    # 自分のplan取得
     plans = current_user.plans
     plans.each do |plan|
       if today == plan.plan_date
         return true
       end
     end

    # 今日の日付 == plan.plan_dateならtrue
  end

  def neglect_friend?(current_user, friend_id)
   notice = Notice.find(2)
   pp "notice----------------------#{notice.inspect}"
    excuted_flag = false # 実行済フラグ
    half_month_flag = false # 半年経過フラグ
    # pattren1 :: plan登録してるけど会ってない
    # 1.自分のプラン取得 (実行済以外)
    plans = current_user.plans.where.not(status: 2)
    # 2. 1のidで自分のフレンド全取得
    friends =Friend.where(id: plans.pluck(:id))

    pp"-------------------#{friends.inspect}!"
    pp"friend_id-------------------#{friend_id}!"
    # その場合はそのフレンドに会ってない.
    # プラン実行済以外のfriendのidがfriend_idと同じなら通知
    friends.each do |friend|
      if friend.id == friend_id
        excuted_flag = true
      end
    end

    half_month_ago = 6.month.ago
    # pattern2::フレンド登録してるけどその人とのplan半年立ててない
    # 1.自分のフレンド全部取得　そのフレンドIDが中間tableにない
    # 2.中間tableに1のidで問い合わせて,見つからない,or 中間のtableのcearted_atが半年以上前
    friends = current_user.friends
    plan_friends = FriendPlan.where(id: friends.pluck(:id))

    plan_friends.each do |plan_friend|
      # 中間tableにdataがない,またdataがあっても半年前ならtrue
      if plan_friend.nil? || plan_friend.created_at < half_month_ago
        if plan_friend.friend_id == friend_id
          half_month_flag = true
        end
      end
    end

    return excuted_flag && half_month_flag

  end
end


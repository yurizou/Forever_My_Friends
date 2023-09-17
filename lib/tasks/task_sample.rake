namespace :task_sample do
  desc '通知作成一覧 Rake Task'
	task friend: :environment do
		puts '通知作成開始'
		today = Date.today
		birthday_friends = Friend.where('birthday like ?', today)
		birthday_friends.each do |friend| 
		  Notice.create(friend_id: friend.id, plan_id: 0)
		end
		
		puts '誕生日通知作成完了'
		now = Time.current
		plans = Plan.where("plan_date >= ?", now.beginning_of_day).where("plan_date <= ?", now.end_of_day)
		plans.each do |plan| 
		  plan.friends.each do |friend|
		    Notice.create(friend_id: friend.id, plan_id: 1)
		  end
		end
		
	
	end
end

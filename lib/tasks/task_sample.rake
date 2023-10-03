namespace :task_sample do
  desc '通知作成一覧 Rake Task'
	task friend: :environment do

		#now = Time.current.ago(6.months) #6ヶ月前
		#now = Time.current.since(10.days) #10日後
		now = Time.current
		today = now.to_date

		puts '通知作成開始'
		birthday_friends = Friend.where(birthday: today)
		birthday_friends.each do |friend|
		  p Notice.create!(user_id: friend.user_id, friend_id: friend.id, plan_id: 0)
		end

		puts '誕生日通知作成完了'

		friends = Friend.includes(:plans).where("plans.plan_date": now.beginning_of_day..now.end_of_day)
		friends.each do |friend|
		  p Notice.create!(user_id: friend.user_id, friend_id: friend.id, plan_id: 1)
		end

		puts '予定日通知完了'
		friends = Friend.includes(:plans).where.not("plans.plan_date": now.beginning_of_day.ago(6.months)..now.end_of_day)
		friends.each do |friend|
			notice = Notice.find_or_initialize_by(user_id: friend.user_id, friend_id: friend.id, plan_id: 2)
			notice.update(updated_at: Time.current)
			p notice 
		end

		puts '疎遠通知完了'
	end
end

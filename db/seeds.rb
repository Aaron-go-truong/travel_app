# Create default roles

Role.create(name: 'admin')
Role.create(name: 'user')

# Create admin account

admin = User.new(email: 'conghung250@gmail.com', password: '123456', roles: Role.where(name: 'admin'), user_name: "Aaron",
                 birth_date: Faker::Date.birthday(min_age: 18, max_age: 65), gender: 'male', address: 'Thu Duc, TP HCM')
admin.skip_confirmation!
admin.save

# Create users information

20.times do
  user = FactoryBot.create(:user, password: 'password_default', password_confirmation: 'password_default')
  user.add_role(:user)
  user.skip_confirmation!
  user.save
end

# Create plans information

10.times do
  plan = FactoryBot.create(:plan, user_id: User.ids.sample)
  plan.save
end

# Create comments information

20.times do
  comment = FactoryBot.create(:comment, plan_id: Plan.ids.sample, user_id: User.ids.sample)
  comment.save
end

# Create likes information

10.times do
  like = FactoryBot.create(:like, likeable_id: Plan.ids.sample, likeable_type: "Plan",user_id: User.ids.sample)
  like.save
end

10.times do
  like = FactoryBot.create(:like, likeable_id: Comment.ids.sample, likeable_type: "Comment",user_id: User.ids.sample)
  like.save
end

20.times do
  user = FactoryBot.create(:user, password: 'password_default', password_confirmation: 'password_default')
  user.add_role(:user)
  user.skip_confirmation!
  user.save
end

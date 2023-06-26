user = User.create(
  email: "aaro1nn@gmail.com",
  password: "123456",
  user_name: "Benzema",
  date_of_birth: '12/05/2001',
  gender: 'male',
  address: 'KTX Khu A'
)
user.avatar.attach(
  io:  File.open(File.join(Rails.root,'app/javascript/images/avatar_default.jpg')),
  filename: 'avatar_default.jpg'
)

user = User.create(
  email: "aaro2nn@gmail.com",
  password: "123456",
  user_name: "Bale",
  date_of_birth: '12/05/2001',
  gender: 'male',
  address: 'KTX Khu A'
)
user.avatar.attach(
  io:  File.open(File.join(Rails.root,'app/javascript/images/avatar_default.jpg')),
  filename: 'avatar_default.jpg'
)

user = User.create(
  email: "aaro3nn@gmail.com",
  password: "123456",
  user_name: "John Stone",
  date_of_birth: '12/05/2001',
  gender: 'male',
  address: 'KTX Khu A'
)
user.avatar.attach(
  io:  File.open(File.join(Rails.root,'app/javascript/images/avatar_default.jpg')),
  filename: 'avatar_default.jpg'
)

user = User.create(
  email: "aaro5nn@gmail.com",
  password: "123456",
  user_name: "Kimmich",
  date_of_birth: '12/05/2001',
  gender: 'male',
  address: 'KTX Khu A'
)
user.avatar.attach(
  io:  File.open(File.join(Rails.root,'app/javascript/images/avatar_default.jpg')),
  filename: 'avatar_default.jpg'
)

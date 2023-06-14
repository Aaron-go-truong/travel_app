plan = User.find(24).plans.create(
  title: "Du lich Vung Tau",
  descriptions: "Home stay view bien 3N-2D",
  time: "5 days",
  address: 'Vung Tau',
  amount: 2500000
)
plan.image_description.attach(
  io:  File.open(File.join(Rails.root,'app/assets/images/avt.png')),
  filename: 'avt.png'
)

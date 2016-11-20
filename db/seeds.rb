# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.create(
  subject: '打ち合わせ',
  body: 'トレーニングの打ち合わせ',
  status: :finished,
  start_at: Time.zone.local(2016, 11, 15, 11, 0, 0),
  closing_at: Time.zone.local(2016, 11, 15, 12, 0, 0)
)

Task.create(
  subject: 'Railsアプリをプッシュする',
  body: 'GitHubにプッシュしてトレーナーをコラボレーターに追加',
  status: :finished,
  start_at: Time.zone.local(2016, 11, 20, 21, 0, 0),
  closing_at: Time.zone.local(2016, 11, 20, 22, 0, 0)
)

Task.create(
  subject: 'トレーニング終了日',
  body: '',
  start_at: Time.zone.local(2016, 11, 21, 0, 0, 0),
  closing_at: Time.zone.local(2016, 12, 20, 23, 59, 59)
)

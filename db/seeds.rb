# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'production'
  50.times do |num|
    Board.create([
      { name: "ユーザー名#{num}", title: "タイトル#{num}", body: "本文#{num}" }
    ])
  end

  Tag.create([
    { name: 'ゲーム'  },
    { name: 'スマホ'  },
    { name: 'プログラミング'  },
    { name: 'パソコン'  },
    { name: 'ご飯'  },
    { name: '仕事'  }
  ])

end

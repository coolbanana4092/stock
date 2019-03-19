FactoryBot.define do
  factory :event do
    user             nil
    name            "m-fukaya"
    genre           "スポーツ"
    organizer       "イベント株式会社"
    place           "日比谷公園"
    ticket_name     "大人"
    price           "1500円"
    date            "2019/1/1"
    starting_time   "13:00"
    ending_time     "16:00"
    content         "サッカー大会をします。優勝チームには商品があります。"
    cautionary_note "最低でも1チームに11人いる状態でエントリーしてください。"
  end
end

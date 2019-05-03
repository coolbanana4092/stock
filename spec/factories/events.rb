FactoryBot.define do
  factory :event do
    user             nil
    name            "m-fukaya"
    genre           "スポーツ"
    organizer       "イベント株式会社"
    place           "日比谷公園"
    ticket_name     "大人"
    price           "1500円"
    starting_year   "2019"
    starting_month  "1"
    starting_day    "21"
    starting_hour   "13"
    starting_minute "30"
    ending_year     "2019"
    ending_month    "1"
    ending_day      "21"
    ending_hour     "15"
    ending_minute   "00"
    content         "サッカー大会をします。優勝チームには商品があります。"
    cautionary_note "最低でも1チームに11人いる状態でエントリーしてください。"
  end
end

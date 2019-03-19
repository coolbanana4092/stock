require 'rails_helper'

RSpec.describe Event, type: :model do
  context "validation" do
    # イベントの全ての情報があれば有効であること
    it "is valid with all information of the event" do
      expect(event).to be_valid
    end

    # イベント名がなければ無効であること
    it "is invalid without a name" do
      event = FactoryBot.build(:event, name: nil)
      event.valid?
      expect(event.errors[:name]).to include("can't be blank")
    end

    # ジャンルがなければ無効であること
    it "is invalid without a genre" do
      event = FactoryBot.build(:event, genre: nil)
      event.valid?
      expect(event.errors[:genre]).to include("can't be blank")
    end

    # 主催者がなければ無効であること
    it "is invalid without a organizer" do
      event = FactoryBot.build(:event, organizer: nil)
      event.valid?
      expect(event.errors[:organizer]).to include("can't be blank")
    end

    # 開催場所がなければ無効であること
    it "is invalid without a place" do
      event = FactoryBot.build(:event, place: nil)
      event.valid?
      expect(event.errors[:place]).to include("can't be blank")
    end

    # チケット名がなければ無効であること
    it "is invalid without a ticket_name" do
      event = FactoryBot.build(:event, ticket_name: nil)
      event.valid?
      expect(event.errors[:ticket_name]).to include("can't be blank")
    end

    # 料金がなければ無効であること
    it "is invalid without a price" do
      event = FactoryBot.build(:event, price: nil)
      event.valid?
      expect(event.errors[:price]).to include("can't be blank")
    end

    # 日付がなければ無効であること
    it "is invalid without a date" do
      event = FactoryBot.build(:event, date: nil)
      event.valid?
      expect(event.errors[:date]).to include("can't be blank")
    end

    # 開始時間がなければ無効であること
    it "is invalid without a starting_time" do
      event = FactoryBot.build(:event, starting_time: nil)
      event.valid?
      expect(event.errors[:starting_time]).to include("can't be blank")
    end

    # 終了時間がなければ無効であること
    it "is invalid without a ending_time" do
      event = FactoryBot.build(:event, ending_time: nil)
      event.valid?
      expect(event.errors[:ending_time]).to include("can't be blank")
    end

    # イベント内容がなければ無効であること
    it "is invalid without a content" do
      event = FactoryBot.build(:event, content: nil)
      event.valid?
      expect(event.errors[:content]).to include("can't be blank")
    end
  end
end

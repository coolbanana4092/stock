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
      expect(event.errors[:name]).to include("を入力してください")
    end

    # ジャンルがなければ無効であること
    it "is invalid without a genre" do
      event = FactoryBot.build(:event, genre: nil)
      event.valid?
      expect(event.errors[:genre]).to include("を入力してください")
    end

    # 主催者がなければ無効であること
    it "is invalid without a organizer" do
      event = FactoryBot.build(:event, organizer: nil)
      event.valid?
      expect(event.errors[:organizer]).to include("を入力してください")
    end

    # 開催場所がなければ無効であること
    it "is invalid without a place" do
      event = FactoryBot.build(:event, place: nil)
      event.valid?
      expect(event.errors[:place]).to include("を入力してください")
    end

    # チケット名がなければ無効であること
    it "is invalid without a ticket_name" do
      event = FactoryBot.build(:event, ticket_name: nil)
      event.valid?
      expect(event.errors[:ticket_name]).to include("を入力してください")
    end

    # 料金がなければ無効であること
    it "is invalid without a price" do
      event = FactoryBot.build(:event, price: nil)
      event.valid?
      expect(event.errors[:price]).to include("を入力してください")
    end

    # 開始日程(年)がなければ無効であること
    it "is invalid without a starting_year" do
      event = FactoryBot.build(:event, starting_year: nil)
      event.valid?
      expect(event.errors[:starting_year]).to include("を入力してください")
    end

    # 開始日程(月)がなければ無効であること
    it "is invalid without a starting_month" do
      event = FactoryBot.build(:event, starting_month: nil)
      event.valid?
      expect(event.errors[:starting_month]).to include("を入力してください")
    end

    # 開始日程(日)がなければ無効であること
    it "is invalid without a starting_day" do
      event = FactoryBot.build(:event, starting_day: nil)
      event.valid?
      expect(event.errors[:starting_day]).to include("を入力してください")
    end

    # 開始日程(時)がなければ無効であること
    it "is invalid without a starting_hour" do
      event = FactoryBot.build(:event, starting_hour: nil)
      event.valid?
      expect(event.errors[:starting_hour]).to include("を入力してください")
    end

    # 開始日程(分)がなければ無効であること
    it "is invalid without a starting_minute" do
      event = FactoryBot.build(:event, starting_minute: nil)
      event.valid?
      expect(event.errors[:starting_minute]).to include("を入力してください")
    end

    # 終了日程(年)がなければ無効であること
    it "is invalid without a ending_year" do
      event = FactoryBot.build(:event, ending_year: nil)
      event.valid?
      expect(event.errors[:ending_year]).to include("を入力してください")
    end

    # 終了日程(月)がなければ無効であること
    it "is invalid without a ending_month" do
      event = FactoryBot.build(:event, ending_month: nil)
      event.valid?
      expect(event.errors[:ending_month]).to include("を入力してください")
    end

    # 終了日程(日)がなければ無効であること
    it "is invalid without a ending_day" do
      event = FactoryBot.build(:event, ending_day: nil)
      event.valid?
      expect(event.errors[:ending_day]).to include("を入力してください")
    end

    # 終了日程(時)がなければ無効であること
    it "is invalid without a ending_hour" do
      event = FactoryBot.build(:event, ending_hour: nil)
      event.valid?
      expect(event.errors[:ending_hour]).to include("を入力してください")
    end

    # 終了日程(分)がなければ無効であること
    it "is invalid without a ending_minute" do
      event = FactoryBot.build(:event, ending_minute: nil)
      event.valid?
      expect(event.errors[:ending_minute]).to include("を入力してください")
    end

    # イベント内容がなければ無効であること
    it "is invalid without a content" do
      event = FactoryBot.build(:event, content: nil)
      event.valid?
      expect(event.errors[:content]).to include("を入力してください")
    end
  end
end

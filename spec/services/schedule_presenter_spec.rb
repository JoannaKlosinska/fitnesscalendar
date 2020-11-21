require "rails_helper"

describe SchedulePresenter do
  describe '#week' do
    it 'returns humanized day names with values returned by #day method' do
      schedule = Schedule.create(tuesday: ['8'])
      subject = SchedulePresenter.new(schedule)
      allow(subject).to receive(:day) do |value| 
        value << 1
      end
      
      expect(subject.week).to(
        eq(
          {
            "Mon" => [1],
            "Tue" => ["8", 1],
            "Wed" => [1], 
            "Thu" => [1], 
            "Fri" => [1], 
            "Sat" => [1], 
            "Sun" => [1]
          }
        )
      )
    end
  end

  describe '#day' do
    it 'sets value to "YES" for hours that are passed' do
      schedule = Schedule.create
      subject = SchedulePresenter.new(schedule)
      result = subject.day(['9', '12'])

      expect(result.find { |x| x[:hour] == '7:00 - 8:00' }[:booking]).to eq 'NO'
      expect(result.find { |x| x[:hour] == '9:00 - 10:00' }[:booking]).to eq 'YES'
      expect(result.find { |x| x[:hour] == '10:00 - 11:00' }[:booking]).to eq 'NO'
      expect(result.find { |x| x[:hour] == '12:00 - 13:00' }[:booking]).to eq 'YES'
    end
  end
end
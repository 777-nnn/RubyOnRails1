class Post < ApplicationRecord

    validates :title, presence: true, length: {maximum: 20 }
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :schedule_memo, length: {maximum: 500 }
  
    validate :start_end_check
  
    def start_end_check
      
      if self.start_date.nil?
        self.start_date = Date.today
      end
      if self.end_date.nil?
        self.end_date = Date.today
      end

      if self.start_date > self.end_date 
        errors.add(:end_date, "は開始日より前の日付は登録できません。")
      end

    end

end
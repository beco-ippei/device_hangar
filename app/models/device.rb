class Device < ActiveRecord::Base
  #belongs_to :user
  #has_many :bookers

  validates :number, presence: true
  validates :name, presence: true
  validates :long_name, presence: true
  validates :os, presence: true

  # 使う (利用者として登録、重複はfalse)
  def use(user_id)
    if self.user_id.nil?
      #TODO: lock_at は他のデータに格納したら良さそう
      # 貸出履歴が保存できるとか
      self.user_id = user_id
      self.lock_at = Time.now
      save
    elsif self.user_id == user_id
      true        # 自分が使ってる
    else
      false       # 他の人が使ってる
    end
  end

  # 返却する (release by user)
  def release(user_id)
    if self.user_id.nil?
      true        # 誰も使ってない
    elsif self.user_id != user_id
      false       # 他の人が使ってる
    else
      self.user_id = nil
      save
    end
  end

  # 次に使いたいな、という予約のようなもの
  def book
  end
end

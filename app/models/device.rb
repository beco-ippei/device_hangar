class Device < ActiveRecord::Base
  belongs_to :user
  #has_many :bookers

  validates :number, presence: true, uniqueness: true
  validates :name, presence: true
#  validates :os

  # 使う (利用者として登録、重複はfalse)
  def use(user)
    if self.user.nil?
      #TODO: lock_at は他のデータに格納したら良さそう
      # 貸出履歴が保存できるとか
      self.user = user
      self.lock_at = Time.now
      save
    elsif self.user.id == user.id
      :using        # 自分が使ってる
    else
      :used       # 他の人が使ってる
    end
  end

  # 返却する (release by user)
  def release(user)
    if self.user.nil?
      true        # 誰も使ってない
    elsif self.user.id != user.id
      false       # 他の人が使ってる
    else
      self.user = nil
      save
    end
  end

  # 次に使いたいな、という予約のようなもの
  def book
  end
end

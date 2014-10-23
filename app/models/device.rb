class Device < ActiveRecord::Base
  include Redis::Objects

#TODO: やり方わからないのでボチボチ実装してみる

  #attr_accessor :id, :name, :long_name, :os, :user, :lock_at, :bookers
  #value :name, :long_name, :os, :lock_at
  #hash :user
  #list :bookers

  validates :id, presence: true
  validates :name, presence: true
  validates :long_name, presence: true
  validates :os, presence: true

  def self.all
    #TODO: とりあえず。キー指定方法を直す
    Redis.current.keys('device:*').select{|e| /device:[0-9]*$/=~e}.map do |key|
      begin
        next if Redis.current.exits key, :id
        device = Device.new Redis::HashKey.new(key).all
      rescue => ex
        #TODO: とりあえず無視
      end
      device
    end
  end

  def self.find(id)
    Device.new Redis::HashKey.new("device:#{id}").all
  end

  def save
    #TODO: check id is exists
    @id = create_id unless @id

    @attributes = Redis::HashKey.new "device:#{@id}"
    @attributes.bulk_set id: @id, name: @name, long_name: @long_name, os: @os
  end

  def create_id
    Redis.current.incr 'id:device'
  end

  def destroy
    Redis.current.delete "device:#{@id}"
  end

  # 使う (利用者として登録、重複はfalse)
  def use(user_id)
    if @user.nil?
      #TODO: lock_at は他のデータに格納したら良さそう
      # 貸出履歴が保存できるとか
      attributes = Redis::HashKey.new "device:#{@id}"
      attributes.bulk_set user: user_id, lock_at: Time.now
    elsif @user == user_id
      true        # 自分が使ってる
    else
      false       # 他の人が使ってる
    end
  end

  # 返却する (release by user)
  def release(user_id)
    p Hash.new '@user' => @user, user_id: user_id
    if @user.nil?
      true        # 誰も使ってない
    elsif @user != user_id
      false       # 他の人が使ってる
    else
      attributes = Redis::HashKey.new "device:#{@id}"
      attributes.delete :user
    end
  end

  # 次に使いたいな、という予約のようなもの
  def book
  end
end

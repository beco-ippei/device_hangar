class Device < ActiveRecord::Base
#TODO: やり方わからないのでボチボチ実装してみる
#class Device
#class Device
#  include ActiveModel

  attr_accessor :id, :name, :long_name, :os, :user, :bookers

  validates :id, presence: true
  validates :name, presence: true
  validates :long_name, presence: true
  validates :os, presence: true

  def self.all
    Redis.current.keys('device:*').map do |key|
      Device.new Redis::HashKey.new(key).all
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
  end

  # 使う (利用者として登録、重複はfalse)
  def use
  end

  # 返却する (release by user)
  def release
  end

  # 次に使いたいな、という予約のようなもの
  def book
  end
end

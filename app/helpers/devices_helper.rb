require 'time'
module DevicesHelper
  def using?(user_id)
    if user_id.nil?
      false     # 誰も使っていない
    elsif user_id == @user[:id]
      true      # 自分が使ってる
    else
      false     # 自分以外が使っている
    end
  end

  # format time
  def tf(time)
    time = Time.parse time_string unless time.kind_of? Time
    time.strftime '%m/%d(%a) %H:%M' if time
  rescue
    nil
  end
end

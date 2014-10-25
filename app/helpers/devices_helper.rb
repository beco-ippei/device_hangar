require 'time'
module DevicesHelper
  def using?(user)
    if user.nil?
      false     # 誰も使っていない
    elsif user.id == current_user.id
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

  def os_name(device)
    [
      device.try(:os),
      device.try(:version)
    ].join(' ').strip
  end
end

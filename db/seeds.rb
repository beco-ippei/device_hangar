# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

gs3 = 'GALAXY S Ⅲ SC-06D'
devices = [
#  [101, 'iPhone5s', 'iPhone5s 16GB SimFree', nil, 'iOS', '8.0.2'],
#  [102, 'Garaxy S4', 'Sumson Garaxy S4 (2013)', 'docomo', 'Android', '4.1.2'],
#  [103, 'iPhone4', 'iPhone4 32GB', 'Softbank', 'iOS', '6.0.2'],
#  [104, 'Nexus5', 'LG Nexus5 16GB', 'e-Mobile', 'Android', '4.4.4'],

  [54 , 'SC-02BGALAXY'         , *%w[sp docomo 2.2 有 080-1452-0647 yumemi-n2051@docomo.ne.jp 0]],
  [132, 'IS12T（windowsphone）', *%w[sp au 7.10.7720.68 有 080-5539-5452 yumemi-w21s@ezweb.ne.jp 記載無し]],
  [142, 'IS03'                 , *%w[sp au 2.2.1 有 080-5302-8049 yumemi-w11h@ezweb.ne.jp,yume23028049@gmail.com 記載無し]],
  [232, 'iphone4 16G'          , *%w[sp softbank 6.1.2 有 080-3358-9736 yumemi3358@softbank.ne.jp 記載無し]],
  [233, 'iphone 3GS'           , *%w[sp softbank 4.3.2 有 090-6025-7681 yumemi60257681@i.softbank.jp 1234]],
  [240, 'Xperia(SO-01B)'       , *%w[sp docomo 1.6 有 090-7704-2479 yumemixperia@gmail.com 0]],
  [257, 'iphone4 16G'          , *%w[sp softbank 4.2.1 有 090-1743-4979 - 記載無し]],
  [258, 'iphone4 16G'          , *%w[sp softbank 6.1.3 有 090-1746-0340 - 記載無し]],
  [260, 'GALAXY S SC-02B'      , *%w[sp docomo 2.2 有 090-2495-7099 - 記載無し]],
  [261, 'IS03'                 , *%w[sp au 2.1-update1 有 080-6702-8479 - 記載無し]],
  [314, 'auIS11N'              , *%w[sp au 2.3.5 有 090-9206-4292 yumemi-is11n@ezweb.ne.jp 記載無し]],
  [319, gs3                    , *%w[sp docomo 4.0.4 有 080-8907-8272 yumemi-sc06d@docomo.ne.jp 1234]],
  [320, 'iPhone5 16G'          , *%w[sp softbank - 有 080-4917-5377 yumemi-4917@i.softbank.jp ]],
  [335, 'XPERIA SO-02E'        , *%w[sp docomo - 有 080-2134-7755 yumemi08021347755@docomo.ne.jp ]],
  [336, 'XPERIA SO-01E'        , *%w[sp docomo 4.0.4 有 080-9563-3934 yumemi08095633934@docomo.ne.jp 2834]],
  [337, 'IS12S'                , *%w[sp au 2.3.7 無 - - 記載無し]],
  [338, 'iPhone5 16G'          , *%w[sp softbank 7 有 080-4416-3923 yumemi08044163923@i.softbank.ne.jp 記載無し]],
  [352, 'F-03D'                , *%w[sp docomo 2.3.5 無 - - 記載無し]],
  [364, 'iphone5s 16G'         , *%w[sp au 7.0.4 有 080-6544-7255 yumemi-080-6544-7255@ezweb.ne.jp ]],
  [365, 'iPhone4 32G'          , *%w[sp - - 無 - - ]],
  [39 , 'CA003'                , *%w[fp au - 有 090-8057-6099 yumemi-39@ezweb.ne.jp 1234]],
  [42 , '840P'                 , *%w[fp softbank - 有 080-3773-8365 yumemi-840p@softbank.ne.jp 2843]],
  [50 , '811SH'                , *%w[fp softbank - 有 080-3138-1397 yumemi-811sh@softbank.ne.jp 1234]],
  [52 , 'F001'                 , *%w[fp au - 有 090-9709-1935 yumemi-52@ezweb.ne.jp 2843]],
  [111, '830SHs'               , *%w[fp softbank - 有 080-3785-0626 yumemi830SHs@softbank.ne.jp 9999]],
  [148, 'CA007'                , *%w[fp au - 有 080-5305-7093 yumemi-148@ezweb.ne.jp 2843]],
  [149, 'K006'                 , *%w[fp au - 有 080-5305-6977 yumemi-149@ezweb.ne.jp 2843]],
  [215, 'DM001SH'              , *%w[fp softbank - 有 090-6041-1784 yumemi-dm001sh@disney.ne.jp 1234]],
  [219, 'W61K'                 , *%w[fp au - 有 090-4455-2674 yumemi-219@ezweb.ne.jp 1234]],
  [225, 'N906i'                , *%w[fp docomo - 有 090-7268-2505 yumemi-n906i@docomo.ne.jp 0]],
  [245, 'SH-03B'               , *%w[fp docomo - 無 - - 0]],
  [246, 'L-04B'                , *%w[fp docomo - 無 - - 0]],
]

devices.each do |line|
  #number, name, long_name, carrier, os, version = line
  number, name, cls, carrier, version, sim, telno, emails, pass = line
  os = if cls == 'fp'
         nil
       elsif /iphone/i =~ name
        'ios'
       else
        'android'
       end
  name = name.gsub(/^"(.*)"$/, '\1')

  d = Device.new number: number, carrier: carrier, classify: cls,
    name: name, sim: sim == '有', os: os, version: version,
    telephone_number: telno, emails: emails, passcode: pass
  if d.valid?
    d.save
  else
    puts "invalid device : num=#{number}, name=#{name} -----"
    #p d.errors
  end
end

u = User.new email: 'ippei@mail.com', password: '0000'
u.save!


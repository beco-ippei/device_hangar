# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

devices = [
  [101, 'iPhone5s', 'iPhone5s 16GB SimFree', 'iOS 8.0.2'],
  [102, 'Garaxy S4', 'Sumson Garaxy S4 (2013)', 'Android 4.1.2'],
  [103, 'iPhone4', 'iPhone4 32GB Softbank', 'iOS 6.0.2'],
  [104, 'Nexus5', 'LG Nexus5 16GB', 'Android 4.4'],
]

devices.each do |line|
  number, name, long_name, os = line

  Device.create number: number, name: name, long_name: long_name, os: os
end


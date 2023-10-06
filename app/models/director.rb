# == Schema Information
#
# Table name: directors
#
#  id            :bigint           not null, primary key
#  bio           :string
#  date_of_birth :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Director < ApplicationRecord
end

class Unit < ApplicationRecord

    belongs_to :course
    has_many :lesson_units
    has_many :lessons, through: :lesson_units

end

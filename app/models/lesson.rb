class Lesson < ApplicationRecord

    belongs_to :category
    has_many :course_lessons
    has_many :courses, through: :course_lessons
    has_many :contents

end

class Lesson < ApplicationRecord

    belongs_to :category
    has_many :lesson_units
    has_many :units, through: :lesson_units
    has_many :course_lessons
    has_many :courses, through: :course_lessons
    has_many :contents
    has_many :user_lessons
    has_many :users, through: :user_lessons

    validates :title, presence: true

end

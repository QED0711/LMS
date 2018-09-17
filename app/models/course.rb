class Course < ApplicationRecord

    has_many :user_courses
    has_many :users, through: :user_courses
    has_many :units
    has_many :lessons, through: :units
    has_many :course_categories
    has_many :categories, through: :course_categories

end

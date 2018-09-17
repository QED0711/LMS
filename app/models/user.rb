class User < ApplicationRecord

    has_many :user_courses
    has_many :courses, through: :user_courses
    has_many :user_lessons
    has_many :lessons, through: :user_lessons    

    has_secure_password

end

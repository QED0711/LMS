class Lesson < ApplicationRecord

    belongs_to :category
    has_many :lesson_units
    has_many :units, through: :lesson_units
    has_many :course_lessons
    has_many :courses, through: :course_lessons
    has_many :contents
    has_many :user_lessons
    has_many :users, through: :user_lessons

    # accepts_nested_attributes_for :category


    validates :title, presence: true

    def category_attributes=(category_attributes)
        self.category = Category.find_or_create_by(category_attributes)
    end

end

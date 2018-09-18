class Course < ApplicationRecord

    has_many :user_courses
    has_many :users, through: :user_courses
    has_many :units
    has_many :lessons, through: :units
    has_many :course_categories
    has_many :categories, through: :course_categories

    validate :valid_title

    def slug
        self.title.gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        title = slug.gsub("-", " ").downcase
        self.find_by(title: title)
    end

    private

    def valid_title
        if self.title.scan(/[\W\D]/)
            self.errors.add(:title, "You many only have letters and numbers in your title")
        end
    end

end

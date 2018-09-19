class Course < ApplicationRecord

    has_many :user_courses
    has_many :users, through: :user_courses
    has_many :units
    has_many :course_lessons
    has_many :lessons, through: :course_lessons
    has_many :course_categories
    has_many :categories, through: :course_categories

    before_validation :downcase_title
    validate :valid_title
    validates :title, uniqueness: true

    def slug
        self.title.gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        title = slug.gsub("-", " ").downcase
        self.find_by(title: title)
    end

    def instructors
        self.users.select do |user|
            user.authorization == "instructor" || user.authorization == "admin"
        end
    end

    def students
        self.users.select do |user|
            user.authorization == "student"
        end
    end

    def self.user_courses(user)
        Course.all.select do |course|
            course.users.include?(user)
        end
    end

    private

    def downcase_title
        self.title = self.title.downcase
    end

    def valid_title
        if !self.title.scan(/[\-\,\!\*\@\#\$\%\^\&\(\)]/).empty?
            self.errors.add(:title, "You many only have letters and numbers in your title")
        end
    end

end

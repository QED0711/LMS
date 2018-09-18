class CoursesController < ApplicationController

    def index
        @courses = Course.all
    end

    def show
        @course = Course.find_by_slug(params[:slug])
        @instructors = @course.instructors
        @students = @course.students
    end



end

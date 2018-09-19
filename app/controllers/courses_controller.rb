class CoursesController < ApplicationController

    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @courses = Course.all.select do |course|
                course.users.include?(@user)
            end
        else
            @courses = Course.all
        end
    end

    def show
        @course = Course.find_by_slug(params[:slug])
        @instructors = @course.instructors
        @students = @course.students
    end



end

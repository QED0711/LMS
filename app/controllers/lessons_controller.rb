class LessonsController < ApplicationController

    def index

    end

    def show
        @lesson = Lesson.find(params[:id])
        @contents = @lesson.contents
        if !@lesson.published
            redirect_to user_courses_path(current_user) unless (current_user.admin? || current_user.instructor?) 
        else
            @contents = @lesson.contents
        end
    end

    def publish
        @lesson = Lesson.find(params[:id])
        if params[:publish] == "true"
            @lesson.published = true
        else
            @lesson.published = false
        end
        @lesson.save
        redirect_to @lesson
    end

end

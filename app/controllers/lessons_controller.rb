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

    def new 
        @course = Course.find(params[:course_id])
        @lesson = Lesson.new
        @lesson.category = Category.new
        
    end

    def create 
        @course = Course.find(params[:course_id])
        @lesson = Lesson.create(lesson_params)
        @lesson.courses << @course
        @lesson.users << current_user
        @lesson.published = false
        # binding.pry
        # @lesson.category = Category.find_or_create_by(title: "Music") # make this line dynamic
        if @lesson.save
            redirect_to new_lesson_content_path(@lesson)
        else
            @lesson.category = Category.new
            render :new
        end
    end

    def destroy
        @lesson = Lesson.find(params[:id])
        @lesson.delete
        redirect_to user_courses_path(current_user)
    end

    def edit
        @lesson = Lesson.find(params[:id])
        @contents = @lesson.contents
    end

    def update

    end

    private

    def lesson_params
        params.require(:lesson).permit(:title, category_attributes: [:title])
    end

end

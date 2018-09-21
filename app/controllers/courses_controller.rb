class CoursesController < ApplicationController

    def index
        if params[:user_id]
            if params[:user_id].to_i == current_user.id
                @user = current_user
                @courses = Course.user_courses(@user)
            else
                redirect_to :root
            end
        else
            @courses = Course.all
        end
    end

    def show
        @course = Course.find_by_slug(params[:slug])
        @instructors = @course.instructors
        @students = @course.students
        @lessons = @course.lessons
    end

    def enroll
        @course = Course.find(params[:id])
        current_user.courses << @course
        redirect_to "/courses/#{@course.slug}"
    end

    def new 
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        @course.users << current_user
        if @course.save
            redirect_to course_path(@course.slug)
        else
            render :new
        end
    end

    private

    def course_params
        params.require(:course).permit(:title) 
    end



end

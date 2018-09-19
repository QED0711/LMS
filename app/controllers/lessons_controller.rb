class LessonsController < ApplicationController

    def index

    end

    def show
        @lesson = Lesson.find(params[:id])
        @contents = @lesson.contents
    end

end

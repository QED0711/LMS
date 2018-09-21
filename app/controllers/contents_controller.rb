class ContentsController < ApplicationController

    def new
        @lesson = Lesson.find(params[:lesson_id])
        @contents = @lesson.contents #? @lesson.contents : Content.new
    end

    def create
        @lesson = Lesson.find(params[:lesson_id])
        @lesson.contents.create(content_params)
        redirect_to new_lesson_content_path
    end

    def edit
    end

    def update
        @lesson = Lesson.find(params[:lesson_id])
        @content = Content.find(params[:id])
        if params[:commit] == "delete"
            @content.delete
        else
            @content.update(content_params)
        end
        # binding.pry
        redirect_to edit_lesson_path(@lesson)
    end

    def destroy

    end

    private

    def content_params
        params.require(:content).permit(:data_type, :data)
    end

end

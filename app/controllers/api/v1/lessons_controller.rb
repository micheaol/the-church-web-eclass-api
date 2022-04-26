class Api::V1::LessonsController < ApplicationController
    def index
        @lessons = Lesson.all

        render json: {lessons: @lessons}
    end
end

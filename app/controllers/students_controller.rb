class StudentsController < ApplicationController
	def new
	end

	def index
		@students = Student.all
	end

	def create
		@student = Student.new(student_params)
		@student.save
		redirect_to @student
	end

	def update
		@student = Student.find(params[:id])
		@student.update(student_params)
		redirect_to @student
	end

	def show
		@student = Student.find(params[:id])
	end

	def edit
		@student = Student.find(params[:id])
	end

	def destroy
		@student = Student.find(params[:id])
		@student.destroy

		redirect_to students_path
	end
end

private
	def student_params
		params.require(:student).permit(:name, :entry_number, :password, :address)
	end
class ExamsController < ApplicationController
  before_action :get_ambiente
  before_action :set_exam, only: %i[ show edit update destroy ]

  # GET /exams or /exams.json
  def index
    @exams = @ambiente.exams
  end

  # GET /exams/1 or /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = @ambiente.exams.build
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams or /exams.json
  def create
    @exam = @ambiente.exams.build(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to user_ambiente_exams_url, notice: "Exam was successfully created." }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1 or /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to user_ambiente_exams_url, notice: "Exam was successfully updated." }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1 or /exams/1.json
  def destroy
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to user_ambiente_exams_path(current_user, @ambiente), notice: "Exam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = @ambiente.exams.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      # params.require(:exam).permit(:name, :description, :num_questions, :exam_date, :exam_time, :ambiente_id)
      params.permit(:name, :description, :num_questions, :exam_date, :exam_time, :ambiente_id, :id)
    end

  private
    def get_ambiente
      @ambiente = Ambiente.find(params[:ambiente_id])
    end
end

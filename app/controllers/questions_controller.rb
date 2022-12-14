class QuestionsController < ApplicationController
  before_action :get_exam
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /questions or /questions.json
  def index
    @questions = @exam.questions
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    # @question = Question.new
    @question = @exam.questions.build
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    # @question = Question.new(question_params)
    @question = @exam.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to user_ambiente_exam_questions_path, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to user_ambiente_exam_questions_path, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @question = Question.find(params[:id])
    redirect_to questions_path, notice: "User not authorized to edit" if @question.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:descricao, :tipo, :dificuldade, :resposta, :ambiente_id, :exam_id)
    end

    def get_exam
      @exam = Exam.find(params['exam_id'])
    end

    def get_ambiente
      @ambiente = Ambiente.find(params['ambiente_id'])
    end
end

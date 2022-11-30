require "erb"

class AmbientesController < ApplicationController
  before_action :get_user
  before_action :set_ambiente, only: %i[ show edit update destroy ]

  # GET /ambientes or /ambientes.json
  def index    
    @ambientes = @user.ambientes
  end

  # GET /ambientes/1 or /ambientes/1.json
  def show
  end

  # GET /ambientes/new
  def new
    @ambiente = @user.ambientes.build
  end

  # GET /ambientes/1/edit
  def edits
  end

  # POST /ambientes or /ambientes.json
  def create

    @ambiente = @user.ambientes.build(ambiente_params)

    respond_to do |format|
      if @ambiente.save
        format.html { redirect_to user_ambientes_path(@user), notice: "Ambiente criado com sucesso." }
        format.json { render :show, status: :created, location: @ambiente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ambiente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ambientes/1 or /ambientes/1.json
  def update
    respond_to do |format|
      if @ambiente.update(ambiente_params)
        format.html { redirect_to user_ambiente_path(@user), notice: "Ambiente foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @ambiente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ambiente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ambientes/1 or /ambientes/1.json
  def destroy
    @ambiente.destroy

    respond_to do |format|
      format.html { redirect_to user_ambientes_path(@user), notice: "Ambiente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def adicionar_aluno
    @template = File.read('app/views/ambientes/adicionar_aluno.erb')
    ERB.new(@template).result( binding )
  end

  def redirect_user_adicionado

    set_ambiente
    @aluno = User.where(email: params[:email]).first
    @ambiente.emails_alunos.push(@aluno.email)
    @ambiente.save

    @ambiente_do_aluno = @ambiente.dup
    @ambiente_do_aluno.user_id = @aluno.id
    @ambiente_do_aluno.save

    @ambiente.exams.each do |exam|

      @exame_atual = exam.dup
      @exame_atual.ambiente_id = @ambiente_do_aluno.id
      @exame_atual.save
      
      exam.questions.each do |pergunta|
        @pergunta_atual = pergunta.dup
        @pergunta_atual.exam_id = @exame_atual.id
        @pergunta_atual.save
      end
    end

    redirect_to user_ambientes_path(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ambiente
      @ambiente = @user.ambientes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ambiente_params
      params.require(:ambiente).permit(:nome, :user_id)
    end

    def get_user
      @user = User.find(params[:user_id])
    end
end

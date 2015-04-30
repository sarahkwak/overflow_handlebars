class AnswersController < ApplicationController

  def index
    # @answers = Answer.all
    @answers = Answer.where(question_id: params[:question_id])
    @question = Question.where(id: params[:question_id]).first
  end

  def create
    @question = Question.where(id: params[:question_id]).first
    @answer = Answer.new(answer_params)
    # @question.answers.new(answer_params)
    respond_to do |format|
      if @answer.save
        @question.answers  << @answer
        format.html { redirect_to question_path(@question)}
        format.json { render json: @answer.to_json}
      else
        format.json { redirect_to question_path(@question) }
      end
    end
  end

  def upvote
    @answer = Answer.where(id: params[:answer_id]).first
    @answer.vote += 1
    @answer.save
    redirect_to question_path
  end

  def downvote
    @answer = Answer.where(id: params[:answer_id]).first
    @answer.vote -= 1
    @answer.save
    redirect_to question_path
  end

  private
    def answer_params
      params.require(:answer).permit(:title, :content)
    end
end

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
    if @answer.save
      @question.answers << @answer
      @question.save
      status = 302
      redirect_to question_path(@answer.question_id)
    else
      redirect_to new_question_path
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

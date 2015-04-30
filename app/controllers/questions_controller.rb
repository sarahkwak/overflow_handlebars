# require 'httparty'
class QuestionsController < ApplicationController
  include HTTParty
  def index
    @response = HTTParty.get('https://api.github.com/zen')
    @quote = @response.parsed_response
    p @quote
    # show all
    @question = Question.new
    @questions = Question.all
  end

  def new
    # get a form for a new item
  end

  def create
  # post route for a new item
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to '/questions', notice: "Your question was successfully created with format.html"}
        format.json { render json: @question.to_json}
      else
        format.json { redirect_to root_path }
      end
    end
  end

  def show
    # individual item shown
    @question = Question.where(id: params[:id]).first
    @answer = Answer.new
    @answers = @question.answers
  end

  def edit
    # get an edit view for an item
    @question = Question.where(id: params[:id]).first
  end

  def update
    # post the update for an item
    @question = Question.where(id: params[:id]).first
    @question.update(question_params)
    redirect_to root_path
  end

  def destroy
    @question = Question.where(id: params[:id]).first
    @question.destroy
    redirect_to root_path
    # post to destroy an item
  end

  def upvote
    @question = Question.where(id: params[:id]).first
    @question.vote += 1
    @question.save
    redirect_to root_path
  end

  def downvote
    @question = Question.where(id: params[:id]).first
    @question.vote -= 1
    @question.save
    redirect_to root_path

  end
 # strong params method
  private
    def question_params
      params.require(:question).permit(:title, :content)
    end


end

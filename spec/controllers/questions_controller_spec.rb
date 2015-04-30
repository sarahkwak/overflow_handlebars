require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:question) {FactoryGirl.create :question}
  let(:attributes) {FactoryGirl.attributes_for :question}

  describe "GET index" do

    before(:each) do
      get :index
    end

    it "has a successful status code of 200" do
      expect(response.status).to eq(200)
    end

    it "assigns question as an instance variable" do
      expect(assigns(:questions)).to be_a(ActiveRecord::Relation)
    end

    it "renders a template to list all questions" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do

    before(:each) do
      get :new
    end

    it "has a successful status code of 200" do
      expect(response.status).to eq(200)
    end

    it "renders a template to render a new question" do
      expect(response).to render_template(:new)
    end
  end

  describe "Post Create" do
    # let!(:question) {FactoryGirl.create :question}
    # let!(:attributes) {FactoryGirl.attributes_for :question}
    # @question = Question.create(title:"asdsd", content:"ssds" )
    before(:each) do
      post :create, question: question.attributes
    end

    it "has a successful status code of 302" do
      expect(response.status).to eq(302)
    end

    xit "creates a new question" do
      expect(assigns(@question)).to be_a_new(Question)
    end

    xit "saves a new question" do

    end

  end


end

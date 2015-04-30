require 'rails_helper'

RSpec.describe Answer, type: :model do
  before :each do
      @answer = Answer.new(title: "John Snow told you so", content: "Off with his head!")
    end
    it "has a title" do
      expect(@answer.title).to eq("John Snow told you so")
    end
    it "has content" do
      expect(@answer.content).to eq("Off with his head!")
    end

    it "it returns the title as a string" do
      expect(@answer.title).to be_a(String)
    end
    it "it returns the content as a string" do
      expect(@answer.content).to be_a(String)
    end

  describe "has a validated title" do
    it { should validate_presence_of(:title)}
  end

    xit { should validate_presence_of(:content)}
    xit "is invalid without a title"
    xit "is invalid without content"
end

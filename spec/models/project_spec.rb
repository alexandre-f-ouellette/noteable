require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "Creation validations" do

    context "Valid projects " do
      let(:valid_project) { FactoryGirl.build(:project_valid) }

      it "is valid when all attributes are valid" do
        expect(valid_project).to be_valid
      end
    end

    context "Invalid projects" do
      let!(:valid_project) { FactoryGirl.create(:project_valid) }
      let(:project_no_name) { FactoryGirl.build(:project_no_name) }
      let(:project_duplicate_short_name) { FactoryGirl.build(:project_duplicate_short_name) }
      let(:project_short_name_too_long) { FactoryGirl.build(:project_short_name_too_long) }

      it "is not valid when there is no name" do
        expect(project_no_name).not_to be_valid
        expect(project_no_name.errors[:name]).to include("can't be blank")
      end

      it "is not valid when the short_name is duplicated" do
        expect(project_duplicate_short_name).not_to be_valid
        expect(project_duplicate_short_name.errors[:short_name]).to include("has already been taken")
      end

      it "is not valid when the short_name is too long" do
        expect(project_short_name_too_long).not_to be_valid
        expect(project_short_name_too_long.errors[:short_name]).to include("is too long (maximum is 20 characters)")
      end
    end
  end
end

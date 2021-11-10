require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET index" do
    context "when the user is logeed in" do
      it "should list users"
    end
  end
  

  describe "#search" do
    it 'should return results' do
      @user = User.create(:first_name => "John", :last_name => "Pandey", :email => "john12@gmail.com")
      expect("and") == (@user)
    end  
  end

  describe 'DELETE #destroy' do
    context "success" do
      it "deletes the user" do
        expect{ 
          @user = User.create(:first_name => "John", :last_name => "Pandey", :email => "john12@gmail.com")
          @user = User.where(first_name: "John")
          delete :destroy, :first_name => @user
       }
      end
    end
  end
end

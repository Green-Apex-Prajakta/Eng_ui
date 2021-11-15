require 'rails_helper'

  RSpec.describe "Users", type: :request do

    let(:user) do
    User.create!(
      first_name: "John", 
      last_name: "Pandey", 
      email: "john.pandey@gmail.coan"
    ) 
  end
    
    describe 'GET /users' do
      it "show list of users" do
        get "/users"
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST /users" do
      it "creates a User" do
        headers = { "CONTENT_TYPE" => "application/json" }
        post "/users", :params => '{ "user": { "first_name":"John", "last_name":"Pandey", "email":"john12@gmail.com" } }', :headers => headers
        expect(response.content_type) == ("application/json; charset=utf-8")
        expect(response).to have_http_status(:success)
      end
    end 
     
    describe 'PATCH /users/:id' do
      context '# check success update' do

        before do
          patch "/users/#{user.id}", params: { "user": { "first_name":"John1", "last_name":"Pandey1", "email":"john.pandey@gmail.com" } }
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
    end

    describe 'DELETE /users/:id' do
      before(:each) do
        user_id = user.id
      end

      it 'should delete user & return status 204' do
        delete "/users/#{user.id}"
        expect(User.where(id: user.id)).to eq []
        expect(response.status).to eq 204
      end
    end
  end   


 
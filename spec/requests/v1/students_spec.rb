require 'rails_helper'

describe "Get students", :type => :request do
  let!(:students) {
    FactoryBot.create_list(:fake_students, 20)
  }

  before {
    get '/api/v1/students'
  }

  it 'returns all students' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "Create an student", :type => :request do
  before do
    post '/api/v1/students',
    params: {
      student: {
        :name => 'Tony Stark',
        :cpf => '19491363026', 
        :email => 'tony.stark@avangers.marvel.hq', 
        :phone => '27987819129', 
        :date_birth => '1989-06-08' 
      }
    }
  end
  
  it 'returns the student name' do
    expect(JSON.parse(response.body)['name']).to eq(controller.params[:student][:name])
  end
  
  it 'returns the cpf' do
    expect(JSON.parse(response.body)['cpf']).to eq(controller.params[:student][:cpf])
  end
  
  it 'returns the email' do
    expect(JSON.parse(response.body)['email']).to eq(controller.params[:student][:email])
  end
  
  it 'returns the phone' do
    expect(JSON.parse(response.body)['phone']).to eq(controller.params[:student][:phone])
  end
  
  it 'returns the date birth' do
    expect(JSON.parse(response.body)['date_birth']).to eq(controller.params[:student][:date_birth])
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end

describe "Update an student" do
  before(:each) do
    @student = create(:fake_students)
  end

  it 'updates a student' do
    @name = 'Steve Rogers'
    
    put "/api/v1/students/#{@student.id}", params: {
      student: {
        :name => @name,
      }
    }

    expect(response).to have_http_status(:ok)
    
    expect(Student.find(@student.id).name).to eq(@name)
  end
end

describe "Delete an student" do
  before(:each) do
    @student1 = create(:fake_students)
    @student2 = create(:fake_students)
  end

  it 'should delete the student' do
    get "/api/v1/students"
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)).to eq([
      YAML.load(@student1.to_json),
      YAML.load(@student2.to_json),
    ])
  
    delete "/api/v1/students/#{@student1.id}"
    expect(response).to have_http_status(:no_content)
  
    get "/api/v1/students"
    expect(JSON.parse(response.body)).to eq([YAML.load(@student2.to_json)])
  end
end
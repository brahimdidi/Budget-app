RSpec.describe '/', type: :request do
  before do
    get root_path
  end

  describe 'expect root path to be splash page' do
    it 'should have inventory name' do
      expect(response.body).to include 'Log in'
    end

    it 'should have sign up button' do
      expect(response.body).to include 'Sign up'
    end
  end
end

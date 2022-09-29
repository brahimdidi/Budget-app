require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'test', email: 'test@gmail.com')
  end
  it 'shows exact name' do
    expect(@user.name).to eql('test')
    expect(@user.email).to eql('test@gmail.com')
  end
  it 'can not create a user without  a name' do
    user = User.new(email: 'test@gmail.com')
    expect(user.valid?).to eql false
  end
end

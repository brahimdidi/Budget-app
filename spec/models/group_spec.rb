require 'rails_helper'

RSpec.describe Group, type: :model do
    before :each do
      @user = User.new(name: 'test', email: 'test@gmail.com')
      @group = Group.new(name: 'group' , icon: 'group icon', user: @user)
    end

    it 'shows exact name' do
      expect(@group.name).to eql ('group')
      expect(@group.icon).to eql ('group icon')
    end
    it 'can not create a group without  a name' do
      group = Group.new(icon: 'group icon', user: @user)
      expect(group.valid?).to eql false
    end
    it 'can not create a group without  an icon' do
      group = Group.new(name: 'group ', user: @user)
      expect(group.valid?).to eql false
    end
end

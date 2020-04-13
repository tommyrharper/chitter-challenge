require 'database_helpers'
require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@example.com', password: 'password123', 
      username: 'testusername', name: 'testname')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
  end
end

describe '.find' do
  it 'finds a user by ID' do
    p "test starts"
    user = User.create(email: 'test@example.com', password: 'password123', 
      username: 'testusername', name: 'testname')

    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
    expect(result.username).to eq user.username
    expect(result.name).to eq user.name
  end

  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
end

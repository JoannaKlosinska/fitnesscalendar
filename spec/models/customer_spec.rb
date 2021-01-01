require "rails_helper"

describe Customer do
  describe '.from_google' do
    context 'with valid attributes' do
      it 'retuns a user when it was already existing' do
        user = User.create!(
          name: 'Bob',
          email: 'bob@email.com',
          uid: '123456',
          password: 'password'
        )
        user_count = Customer.count

        expect(Customer.from_google(uid: '123456', email: 'bob@email.com', full_name: 'Mike')).to eq user
        expect(Customer.count).to eq user_count
        expect(user.reload.name).to eq 'Bob' # should not update existing user
      end

      it 'creates a new user when there was no such user before' do
        user_count = Customer.count

        Customer.from_google(uid: '123456', email: 'bob@email.com', full_name: 'Mike')

        expect(Customer.count).to eq(user_count + 1)
        new_customer = Customer.last
        expect(new_customer.name).to eq 'Mike'
        expect(new_customer.email).to eq 'bob@email.com'
        expect(new_customer.uid).to eq '123456'
      end
    end

    context 'with invalid attributes' do
      it 'returns nil and does not create a new user' do
        user_count = Customer.count

        expect(Customer.from_google(uid: nil, email: nil, full_name: nil)).to eq nil
        expect(Customer.count).to eq user_count
      end
    end
  end
end
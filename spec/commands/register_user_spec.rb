describe RegisterUser do
  subject(:context) { described_class.call(email, password) }

  before(:each) do
    User.delete_all
  end

  describe 'creates user' do
    context 'when the context is successful' do
      let(:email) { 'new_email' }
      let(:password) { 'strong_password' }

      it 'succeeds' do
        expect(context).to be_success
      end
    end
  end

end

describe TweetsController, type: :request do
  before do
    User.delete_all
    Tweet.delete_all
  end

  def authenticated_header()
    RegisterUser.call('correct_email', 'correct_password')
    token = AuthenticateUser.call('correct_email', 'correct_password').result
    { 'Authorization': "Bearer #{token}" }
  end

  it "POST /tweet" do
    expect{
      post '/tweet', params: { tweet: { message: "I'm a tweet" } }, headers: authenticated_header()
    }.to change(Tweet, :count).by(1)
  end

  context 'when the request with NO authentication header' do
    it 'should return unauth for retrieve current user info before login' do
      get '/tweets'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'when the request contains an authentication header' do
    it 'should return the user info' do
      get '/tweets', headers: authenticated_header()
      expect(response).to be_success
    end
  end

end

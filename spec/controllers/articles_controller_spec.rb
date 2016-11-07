require 'rails_helper'
require 'support/macros'
RSpec.describe ArticlesController, type: :controller do

  describe "GET #index" do
  	before do
  		@john = User.create(email: 'john@example.com', password: '11111111')
  	end

  	context 'owner is allowed to edit his article' do 
  		it 'render the edit template' do
  			login_user @john
  			article = Article.create(title: 'First', body: 'First body', user: @john)

  			get :edit, id: article
  			expect(response).to render_template :edit
  		end
  	end

  	context 'Non owner is not allowed to edit other user article' do
  		it 'redirect to the root path' do
  			fred = User.create(email: 'fred@example.com', password: '1111111')
  			login_user fred

  			article = Article.create(title: 'First', body: 'First body', user: @john)

  			get :edit, id: article
  			expect(response).to redirect_to(root_path)
  			message = 'You can only edit your own article.'
  			expect(flash[:danger]).to eq(message)
  		end
  	end  	

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end

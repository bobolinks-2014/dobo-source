require 'spec_helper'

describe ArticlesController do
  include Devise::TestHelpers
	context 'when user is not logged in' do

	  it 'should have an index with a response of 200, OK' do
	    get :index
	    expect(response.status).to eq 200
	  end

	  it 'should not have access to the article#new page, response 302, redirect' do
	    get :new
	    expect(response.status).to eq 302
	  end

    pending 'should have access to the article#show page, response 200' do
	    get :show
	    expect(response.status).to eq 200
	  end

	  pending 'should not have access to the article#edit page, response 302, redirect' do
	    get :edit
	    expect(response.status).to eq 302
	  end

	  pending 'should not have access to the article#destroy page, response 302, redirect' do
	    get :delete
	    expect(response.status).to eq 302
	  end
	end

	context 'when user is logged in' do

	  pending 'should have an index with a response of 200, OK' do
	    get :index
	    expect(response.status).to eq 200
	  end

	  pending 'should have access to the article#new page, response 200' do
	    get :new
	    expect(response.status).to eq 200
	  end

    pending 'should have access to the article#show page, response 200' do
	    get :show
	    expect(response.status).to eq 200
	  end

	end

	context 'logged in users and editing or deleting articles' do
		let(:user) {}
		
		describe 'CAN edit / delete their own articles' do 

		  pending 'should have access to the article#edit page when article belongs to user, response 200' do
		    get :edit
		    expect(response.status).to eq 200
		  end

		  pending 'should have access to the article#destroy page when article belongs to user, response 200' do
		    get :destroy
		    expect(response.status).to eq 200
		  end

		end

		describe 'CANNOT edit / delete others\' articles' do 

		  pending 'should not have access to the article#edit page when article does not belong to user, response 404, redirect' do
		    get :edit
		    expect(response.status).to eq 404
		  end

		  pending 'should not have access to the article#destroy page when article does not belong to user, response 404, redirect' do
		    get :destroy
		    expect(response.status).to eq 404
		  end
	
		end
	
	end

end

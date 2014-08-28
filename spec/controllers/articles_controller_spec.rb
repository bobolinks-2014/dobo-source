require 'spec_helper'

describe ArticlesController do
  include Devise::TestHelpers

  it 'should have an index with a response of 200, OK' do
    get :index
    expect(response.status).to eq 200
  end

  it 'should not have access to the article#new page, reponse 302, redirect' do
    get :new
    expect(response.status).to eq 302
  end

end

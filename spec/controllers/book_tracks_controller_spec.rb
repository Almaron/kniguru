require 'spec_helper'

describe BookTracksController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'read'" do
    it "returns http success" do
      get 'read'
      response.should be_success
    end
  end

  describe "GET 'unread'" do
    it "returns http success" do
      get 'unread'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end

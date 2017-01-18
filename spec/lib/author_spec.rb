require 'spec_helper'
require_relative '../../lib/alchemy_language/generator/alchemy_request'
require_relative '../../lib/alchemy_language/active_method/extra'
require_relative '../../lib/alchemy_language/model/author'


describe AlchemyLanguage::Author do
  subject(:author) {  AlchemyLanguage::Author.new("/path", "url") }

  it "has accessor for path" do
    is_expected.to respond_to(:path)
  end

  it "has accessor for auth_token" do
    is_expected.to respond_to(:auth_token)
  end

  it "has accessor for type" do
    is_expected.to respond_to(:type)
  end

  describe "initialize" do
    it "path instance variable" do
      expect(author.path).to eq("/path")
    end

    it "auth_token instance variable" do
      expect(author.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetAuthors?apikey=#{author.auth_token}&url=#{author.path}" }
    it "get end point with auth_token and path" do
      expect(author.end_point).to eq(complete_path)
    end
  end
end

def json_resultat
  {
  "status": "OK",
  "usage": "By accessing AlchemyAPI or using information generated by AlchemyAPI, you are agreeing to be bound by the AlchemyAPI Terms of Use: http://www.alchemyapi.com/company/terms.html",
  "url": "http://techcrunch.com/2016/01/29/ibm-watson-weather-company-sale/",
  "authors": {
    "names": [
      "Author Name 1",
      "Author Name 2"
    ]
    }
  }
end

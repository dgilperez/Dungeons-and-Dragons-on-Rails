require 'spec_helper'

describe "Characters" do
  describe "GET /characters" do
    it "works!" do
      get characters_path
      response.status.should be(200)
    end
  end
end

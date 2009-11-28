require "spec_helper"

describe String do

  describe "snakecase" do
    it "converts a lowerCamelCase String to snakecase" do
      "lowerCamelCase".snakecase.should == "lower_camel_case"
    end
  end

  describe "lower_camelcase" do
    it "converts a snakecase String to lowerCamelCase" do
      "lower_camel_case".lower_camelcase.should == "lowerCamelCase"
    end
  end

  describe "strip_namespace" do
    it "strips the namespace from a namespaced String" do
      "ns:customer".strip_namespace.should == "customer"
    end

    it "returns the original String for a String without namespace" do
      "customer".strip_namespace.should == "customer"
    end
  end

  describe "map_soap_response" do
    it "returns a DateTime Object for Strings matching the xs:dateTime format" do
      UserFixture.datetime_string.map_soap_response.should ==
        DateTime.parse(UserFixture.datetime_string)
    end

    it "returns true for Strings matching 'true'" do
      "true".map_soap_response.should be_true
    end

    it "returns false for Strings matching 'false'" do
      "false".map_soap_response.should be_false
    end

    it "defaults to return the original value" do
      "whatever".map_soap_response.should == "whatever"
    end
  end

  describe "to_soap_value" do
    it "calls to_s, bypassing Rails to_datetime extension for Strings" do
      "string".to_soap_value.should == "string".to_s
    end
  end

end
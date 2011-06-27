require 'spec_helper'

describe EM::C2DM::Notification do
  describe "#params" do
    it "includes does not allow empty options" do
      lambda {
        EM::C2DM::Notification.new("ABC")
      }.should raise_error

      lambda {
        EM::C2DM::Notification.new("ABC", {})
      }.should raise_error
    end

    it "includes registration_id" do
      notification = EM::C2DM::Notification.new("ABC", :alert => "hi")
      notification.params.should == {
        "registration_id" => "ABC",
        "data.alert" => "hi"
      }
    end

    it "adds collapse_key if given" do
      notification = EM::C2DM::Notification.new("ABC", :collapse_key => "foo")
      notification.params.should == {
        "registration_id" => "ABC",
        "collapse_key" => "foo"
      }
    end

    it "prefixes all other params with 'data.'" do
      notification = EM::C2DM::Notification.new("ABC",
        :foo => "bar",
        :biz => "baz"
      )
      notification.params.should == {
        "registration_id" => "ABC",
        "data.foo" => "bar",
        "data.biz" => "baz"
      }
    end
  end
end

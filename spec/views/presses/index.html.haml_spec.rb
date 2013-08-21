require 'spec_helper'

describe "presses/index" do
  before(:each) do
    assign(:presses, [
      stub_model(Press,
        :head => "Head",
        :content => "MyText",
        :paper_name => "Paper Name",
        :paper_url => "Paper Url"
      ),
      stub_model(Press,
        :head => "Head",
        :content => "MyText",
        :paper_name => "Paper Name",
        :paper_url => "Paper Url"
      )
    ])
  end

  it "renders a list of presses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Head".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Paper Name".to_s, :count => 2
    assert_select "tr>td", :text => "Paper Url".to_s, :count => 2
  end
end

require 'spec_helper'

describe "presses/show" do
  before(:each) do
    @press = assign(:press, stub_model(Press,
      :head => "Head",
      :content => "MyText",
      :paper_name => "Paper Name",
      :paper_url => "Paper Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Head/)
    rendered.should match(/MyText/)
    rendered.should match(/Paper Name/)
    rendered.should match(/Paper Url/)
  end
end

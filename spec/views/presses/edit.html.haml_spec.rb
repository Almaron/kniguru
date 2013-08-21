require 'spec_helper'

describe "presses/edit" do
  before(:each) do
    @press = assign(:press, stub_model(Press,
      :head => "MyString",
      :content => "MyText",
      :paper_name => "MyString",
      :paper_url => "MyString"
    ))
  end

  it "renders the edit press form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", press_path(@press), "post" do
      assert_select "input#press_head[name=?]", "press[head]"
      assert_select "textarea#press_content[name=?]", "press[content]"
      assert_select "input#press_paper_name[name=?]", "press[paper_name]"
      assert_select "input#press_paper_url[name=?]", "press[paper_url]"
    end
  end
end

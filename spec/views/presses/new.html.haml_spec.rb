require 'spec_helper'

describe "presses/new" do
  before(:each) do
    assign(:press, stub_model(Press,
      :head => "MyString",
      :content => "MyText",
      :paper_name => "MyString",
      :paper_url => "MyString"
    ).as_new_record)
  end

  it "renders new press form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", presses_path, "post" do
      assert_select "input#press_head[name=?]", "press[head]"
      assert_select "textarea#press_content[name=?]", "press[content]"
      assert_select "input#press_paper_name[name=?]", "press[paper_name]"
      assert_select "input#press_paper_url[name=?]", "press[paper_url]"
    end
  end
end

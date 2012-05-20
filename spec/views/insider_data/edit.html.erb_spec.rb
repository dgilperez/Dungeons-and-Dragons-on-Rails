require 'spec_helper'

describe "insider_data/edit" do
  before(:each) do
    @insider_datum = assign(:insider_datum, stub_model(InsiderDatum,
      :original_id => 1,
      :name => "MyString",
      :html => "MyString",
      :data_type => "MyString"
    ))
  end

  it "renders the edit insider_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => insider_data_path(@insider_datum), :method => "post" do
      assert_select "input#insider_datum_original_id", :name => "insider_datum[original_id]"
      assert_select "input#insider_datum_name", :name => "insider_datum[name]"
      assert_select "input#insider_datum_html", :name => "insider_datum[html]"
      assert_select "input#insider_datum_data_type", :name => "insider_datum[data_type]"
    end
  end
end

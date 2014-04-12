require 'spec_helper'

describe "Item Pages" do

  subject { page }

  describe "create a new item page" do
    before  { visit new_item_path }

    it { should have_content('Add an item to the exchange') }
    it { should have_selector('option') }
  end

  describe "create a new item" do
    before { visit new_item_path }

    let(:submit) { "Add my item" }

    describe "with invalid information" do
  
      it "should not create an item" do
        expect { click_button submit }.not_to change(Item, :count)
      end

      describe "after submission" do
        before { click_button submit}

        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      pending
      before do
        select "Kale", from: "item_category_id"
        fill_in "Name", with: "Curly Kale"
        fill_in "Description", with: "I have lots of Kale. Come get some."
        fill_in "Location", with: "17th and Pettygrove Portland Oregon" 
        fill_in "Email", with: "example@example.com"
      end
      
      it "should create a new item" do
        expect { click_button submit }.to change(Item, :count).by(1)
      end
    end
  end
end
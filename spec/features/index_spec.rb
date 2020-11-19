require 'spec_helper'

describe "index", type: :feature do
  it "loads properly" do
    visit '/'

    expect(page).to have_selector 'h1'
  end
end

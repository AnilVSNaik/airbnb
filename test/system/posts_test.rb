require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    fill_in "Amenities", with: @post.amenities
    fill_in "Desc", with: @post.desc
    fill_in "Host", with: @post.host
    fill_in "House Rules", with: @post.house_rules
    fill_in "Location", with: @post.location
    fill_in "Name", with: @post.name
    fill_in "Price", with: @post.price
    fill_in "Reviews", with: @post.reviews
    fill_in "Similar Listings", with: @post.similar_listings
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Amenities", with: @post.amenities
    fill_in "Desc", with: @post.desc
    fill_in "Host", with: @post.host
    fill_in "House Rules", with: @post.house_rules
    fill_in "Location", with: @post.location
    fill_in "Name", with: @post.name
    fill_in "Price", with: @post.price
    fill_in "Reviews", with: @post.reviews
    fill_in "Similar Listings", with: @post.similar_listings
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end

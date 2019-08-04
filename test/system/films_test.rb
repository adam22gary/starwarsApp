require "application_system_test_case"

class FilmsTest < ApplicationSystemTestCase
  setup do
    @film = films(:one)
  end

  test "visiting the index" do
    visit films_url
    assert_selector "h1", text: "Films"
  end

  test "creating a Film" do
    visit films_url
    click_on "New Film"

    fill_in "Characters", with: @film.characters
    fill_in "Director", with: @film.director
    fill_in "Opening crawl", with: @film.opening_crawl
    fill_in "Planets", with: @film.planets
    fill_in "Producer", with: @film.producer
    fill_in "Release date", with: @film.release_date
    fill_in "Species", with: @film.species
    fill_in "Starships", with: @film.starships
    fill_in "Title", with: @film.title
    fill_in "User", with: @film.user_id
    fill_in "Vehicles", with: @film.vehicles
    click_on "Create Film"

    assert_text "Film was successfully created"
    click_on "Back"
  end

  test "updating a Film" do
    visit films_url
    click_on "Edit", match: :first

    fill_in "Characters", with: @film.characters
    fill_in "Director", with: @film.director
    fill_in "Opening crawl", with: @film.opening_crawl
    fill_in "Planets", with: @film.planets
    fill_in "Producer", with: @film.producer
    fill_in "Release date", with: @film.release_date
    fill_in "Species", with: @film.species
    fill_in "Starships", with: @film.starships
    fill_in "Title", with: @film.title
    fill_in "User", with: @film.user_id
    fill_in "Vehicles", with: @film.vehicles
    click_on "Update Film"

    assert_text "Film was successfully updated"
    click_on "Back"
  end

  test "destroying a Film" do
    visit films_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Film was successfully destroyed"
  end
end

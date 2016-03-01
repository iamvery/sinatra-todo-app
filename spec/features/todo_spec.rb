require "spec_helper"
require "./task"
require "pry"

RSpec.describe "the todo app", type: :feature do
  after do
    # We don't have any any db management setup for tests, so we might
    # want to use something like database_cleaner to keep records removed
    # between test runs.
    Task.all.each(&:destroy)
  end

  describe "tasks index" do
    it "displays all tasks" do
      Task.create(description: "task 1")
      Task.create(description: "task 2")

      visit "/"

      expect(page).to have_content("task 1")
      expect(page).to have_content("task 2")
    end
  end

  describe "task creation" do
    it "displays created tasks" do
      visit "/"

      expect(page).not_to have_content("hahahaha task!")

      fill_in "Description", with: "hahahaha task!"
      click_on "Submit"

      expect(page).to have_content("hahahaha task!")
    end
  end
end

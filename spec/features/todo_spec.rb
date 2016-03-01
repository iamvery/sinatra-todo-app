require "spec_helper"
require "./task"
require "pry"

RSpec.describe "the todo app", type: :feature do
  after do
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
end

require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Should create projects with correct data" do
    assert Project.new(name: 'testdata', user_id: users(:one).id).save
  end

  test "Should not create projects without user_id" do
    assert_not Project.new(name: 'testdata').save
  end

  test "Should not create projects without name" do
    assert_not Project.new(user_id: users(:one).id)
  end

  test "Should delete projects which does not have task and document" do
    project = Project.create(name: 'testdata', user_id: users(:one).id)
    assert project.destroy
  end

  test "Should not delete projects which has documents" do
    project = Project.create(name: 'testdata', user_id: users(:one).id)
    Document.create(content: 'testdocument', project_id: project.id)
    assert_not project.destroy
  end

  test "Should not delete projects which has tasks" do
    project = Project.create(name: 'testdata', user_id: users(:one).id)
    Task.create(content: 'testtask', project_id: project.id)
    assert_not project.destroy
  end
end

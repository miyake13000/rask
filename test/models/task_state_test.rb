require "test_helper"

class TaskStateTest < ActiveSupport::TestCase

  test "should create task_state with correct data" do
    assert TaskState.new(name: "test", priority: 0).valid?
  end

  test "should not create task_state without name" do
    assert_not TaskState.new(priority: 0).valid?
  end

  test "should not create task_state without priority" do
    assert_not TaskState.new(name: "test").valid?
  end

  test "should delete task_state" do
    TaskState.new(name: "test", priority: 0)
    assert_not TaskState.last.destroy
  end

end

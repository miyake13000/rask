require "test_helper"

class ActionItemTest < ActiveSupport::TestCase
  test "Should create with correct data" do
    assert ActionItem.new.valid?
  end

  test "Should be added uid to created action_item" do
    ActionItem.create
    assert ActionItem.last.uid.present?
  end

  test "Should be added task_url to created action_item" do
    ActionItem.create
    assert ActionItem.last.save(task_url: '/test')
  end

  test "Should delete action_item" do
    ActionItem.create
    assert ActionItem.last.destroy
  end

  test "Should not update uid that is added once" do
    ActionItem.create
    assert_not ActionItem.last.update(uid: -1)
  end

  test "Should not update uid with uid already exists" do
    ActionItem.create
    assert_not ActionItem.last.update(uid: ActionItem.first.uid)
  end

  test "Should not update task_url with string other than URL" do
    ActionItem.create
    assert_not ActionItem.last.save(task_url: '#This is not url#')
  end
end

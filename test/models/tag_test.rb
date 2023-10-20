require "test_helper"

class TagTest < ActiveSupport::TestCase
  test "should create tags with correct data" do
    assert Tag.new(name: "test_tag").save
  end

  test "should not create tag without name" do
    assert_not Tag.new.save
  end

  test "should not create tag that has same name" do
    Tag.create(name: "same_name_tag")
    assert_not Tag.new(name: "same_name_tag").save
  end

  test "should delete tag which has neither tasks nor documents" do
    tag = Tag.create(name: "tag_has_neither_tasks_nor_documents")
    assert tag.destroy
  end

  test "should not delete tag which has task" do
    tag = tags(:tag_has_task)
    assert_not tag.destroy
  end

  test "should not delete tag which has document" do
    tag = tags(:tag_has_document)
    assert_not tag.destroy
  end
end

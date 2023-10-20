require "test_helper"
require 'securerandom'

class ApiTokenTest < ActiveSupport::TestCase

  test "should create with correct data" do
    assert ApiToken.new(secret: "rask-"+ SecureRandom.uuid, user_id: 1).valid?
  end

  test "should not create api_token without secret" do
    assert_not ApiToken.new(user_id: 1).valid?
  end

  test "should not create api_token without user_id" do
    assert_not ApiToken.new(secret: "rask-"+ SecureRandom.uuid).valid?
  end

  test "should update description" do
    ApiToken.create(secret:"rask-"+ SecureRandom.uuid, user_id: 1)
    assert ApiToken.last.update(description: "Test")
  end

  test "should delete api_token" do
    ApiToken.create(secret:"rask-"+ SecureRandom.uuid, user_id: 1)
    assert ApiToken.last.destroy
  end

end

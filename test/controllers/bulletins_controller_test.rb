# frozen_string_literal: true
require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @bulletin = bulletins(:one)
    @category = categories(:one)
    @attrs = {
      title: Faker::TvShows::TheITCrowd.character,
      body: Faker::TvShows::TheITCrowd.quote,
      category_id: @category.id
    }
  end

  test 'get index' do
    get root_url
    assert_response :success
  end

  test 'show bulletin' do
    get bulletin_url(@bulletin)
    assert_response :success
  end

  # test 'should create bulletin' do
  #   login_with_user(@user)
  #   post bulletin_url, params: { bulletin: @attrs }
  #   bulletin = Bulletin.find_by title: @attrs[:title]
  #   assert_redirected_to bulletin_url(bulletin)
  # end
end

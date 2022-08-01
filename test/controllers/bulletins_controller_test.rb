# frozen_string_literal: true
require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @bulletin = bulletins(:one)
    @category = categories(:one)
    @attrs = {
      title: Faker::TvShows::TheITCrowd.character,
      description: Faker::TvShows::TheITCrowd.quote,
      category_id: @category.id
    }
  end

  test 'get index' do
    get root_url
    assert_response :success
  end

  test 'show one bulletin' do
    get bulletin_url(@bulletin)
    assert_response :success
  end

  test 'get new bulletin' do
    sign_in users(:one)

    get new_bulletin_url
    assert_response :success
  end

  test 'create bulletin' do
    sign_in(@user)
    post bulletins_url, params: { bulletin: @attrs
      .merge(image: fixture_file_upload('zero.jpg', 'image/jpg')) }
    bulletin = Bulletin.find_by @attrs
    assert_redirected_to bulletin_url(bulletin)
    assert { bulletin }
  end

  # test 'not get new if user not logged in' do
  #   get new_bulletin_url
  #   assert_response :unprocessable_entity 
  # end

  # test 'not create bulletin if user not logged in' do

  # end

  test 'not create without title' do
    sign_in(@user)

    @attrs[:title] = nil
    post bulletins_url, params: { bulletin: @attrs
      .merge(image: fixture_file_upload('zero.jpg', 'image/jpg')) }
    bulletin = Bulletin.find_by @attrs
    assert { !bulletin }
    assert_response :unprocessable_entity

  end

  #   test 'edit bulletin' do
  #   sign_in(@user)

  #   get edit_bulletin_url(@bulletin)

  #   assert_response :success
  # end

  # test 'not edit if user not logged in' do
  #   get edit_bulletin_url(@bulletin)

  #   assert_response :unprocessable_entity
  # end

  # test 'update bulletin' do
  #   login_with_user(@user)

  #   patch bulletin_url(@bulletin), params: 

  #   @bulletin.reload
  #   assert { @bulletin_params[:title] == @bulletin.title }
  # end
end

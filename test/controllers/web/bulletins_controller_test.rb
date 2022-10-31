# frozen_string_literal: true

require 'test_helper'

module Web
  class BulletinsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = users(:one)
      @bulletin_draft = bulletins(:draft)
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

    test 'show one published bulletin' do
      @bulletin = bulletins(:published)
      get bulletin_url(@bulletin)
      assert_response :success
    end

    test 'show my not published bulletin' do
      get bulletin_url(@bulletin_draft)
      assert_redirected_to root_url
    end

    test 'get new bulletin' do
      sign_in users(:one)

      get new_bulletin_url
      assert_response :success
    end

    test 'not get new if user not logged in' do
      get new_bulletin_url
      assert_redirected_to root_url
    end

    test 'create bulletin' do
      sign_in(@user)
      post bulletins_url, params: { bulletin: @attrs
        .merge(image: fixture_file_upload('zero.jpg', 'image/jpg')) }
      bulletin = Bulletin.find_by @attrs
      assert_redirected_to profile_url
      assert { bulletin }
    end

    test 'not create bulletin if user not logged in' do
      post bulletins_url, params: { bulletin: @attrs
        .merge(image: fixture_file_upload('zero.jpg', 'image/jpg')) }
      assert_redirected_to root_url
    end

    test 'not create without title' do
      sign_in(@user)

      @attrs[:title] = nil
      post bulletins_url, params: { bulletin: @attrs
        .merge(image: fixture_file_upload('zero.jpg', 'image/jpg')) }
      assert_response :unprocessable_entity
    end

    test 'edit bulletin' do
      sign_in(@user)

      get edit_bulletin_url(@bulletin_draft)
      assert_response :success
    end

    test 'not edit if user not logged in' do
      get edit_bulletin_url(@bulletin_draft)
      assert_redirected_to root_url
    end

    test 'update bulletin' do
      @bulletin = bulletins(:draft)
      sign_in(@user)

      patch bulletin_url(@bulletin), params: { bulletin: @attrs
        .merge(image: fixture_file_upload('zero.jpg', 'image/jpg')) }
      @bulletin.reload
      bulletin = Bulletin.find_by @attrs
      assert { bulletin }
    end

    test 'not update if user not logged in' do
      @bulletin = bulletins(:draft)
      patch bulletin_url(@bulletin), params: { bulletin: @attrs
        .merge(image: fixture_file_upload('zero.jpg', 'image/jpg')) }
      @bulletin.reload
      assert_redirected_to root_url
    end

    test 'archive published' do
      sign_in(@user)
      @bulletin = bulletins(:published)

      patch archive_bulletin_url(@bulletin)

      assert_redirected_to profile_url
      @bulletin.reload
      assert { @bulletin.archived? }
    end

    test 'moderate draft' do
      sign_in(@user)
      @bulletin = bulletins(:draft)

      patch moderate_bulletin_url(@bulletin)

      assert_redirected_to profile_url
      @bulletin.reload
      assert { @bulletin.under_moderation? }
    end
  end
end

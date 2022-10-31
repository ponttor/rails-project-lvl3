# frozen_string_literal: true

require 'test_helper'

module Web
  module Admin
    class CategoriesControllerTest < ActionDispatch::IntegrationTest
      setup do
        sign_in users(:admin)
        @category = categories(:one)
        @attrs = {
          name: Faker::TvShows::TheITCrowd.character
        }
      end

      test 'index' do
        get admin_categories_url
        assert_response :success
      end

      test 'new' do
        get new_admin_category_url
        assert_response :success
      end

      test 'create' do
        post admin_categories_url, params: { category: @attrs }
        assert_redirected_to admin_categories_url
        category = Category.find_by @attrs
        assert { category }
      end

      test 'edit' do
        get edit_admin_category_url(@category)
        assert_response :success
      end

      test 'update' do
        patch admin_category_url(@category), params: { category: @attrs }
        @category.reload
        category = Category.find_by @attrs
        assert { category }
      end

      test 'destroy' do
        delete admin_category_url(@category)
        assert_redirected_to admin_categories_url
        assert_nil Category.find_by @attrs
      end
    end
  end
end

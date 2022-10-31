# frozen_string_literal: true

require 'test_helper'

module Web
  module Admin
    class HomeControllerTest < ActionDispatch::IntegrationTest
      test 'admin in' do
        sign_in users(:admin)
        get admin_bulletins_url

        assert_response :success
      end

      test 'admin out' do
        get admin_bulletins_url

        assert_redirected_to root_url
      end
    end
  end
end

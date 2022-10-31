# frozen_string_literal: true

require 'test_helper'

module Web
  module Admin
    class BulletinsControllerTest < ActionDispatch::IntegrationTest
      setup do
        sign_in users(:admin)
      end

      test 'index' do
        get admin_root_url
        assert_response :success
      end

      test 'archive' do
        @bulletin = bulletins(:published)

        patch archive_admin_bulletin_url(@bulletin)

        assert_redirected_to admin_root_path
        @bulletin.reload
        assert { @bulletin.archived? }
      end

      # test 'publish' do
      #   @bulletin = bulletins(:under_moderation)

      #   patch publish_admin_bulletin_url(@bulletin)

      #   assert_redirected_to admin_root_path
      #   @bulletin.reload
      #   assert { @bulletin.published? }
      # end

      test 'reject' do
        @bulletin = bulletins(:published)

        patch reject_admin_bulletin_url(@bulletin)

        assert_redirected_to admin_root_path
        @bulletin.reload
        assert { @bulletin.rejected? }
      end
    end
  end
end

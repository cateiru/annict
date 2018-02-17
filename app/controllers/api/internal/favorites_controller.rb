# frozen_string_literal: true
# == Schema Information
#
# Table name: likes
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  resource_id   :integer          not null
#  resource_type :string(510)      not null
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  likes_user_id_idx  (user_id)
#

module Api
  module Internal
    class FavoritesController < Api::Internal::ApplicationController
      before_action :authenticate_user!

      def create(resource_type, resource_id, page_category)
        resource = resource_type.constantize.find(resource_id)
        current_user.favorite(resource)
        ga_client.page_category = page_category
        ga_client.events.create(:favorites, :create)
        head 200
      end

      def unfavorite(resource_type, resource_id)
        resource = resource_type.constantize.find(resource_id)
        current_user.unfavorite(resource)
        head 200
      end
    end
  end
end

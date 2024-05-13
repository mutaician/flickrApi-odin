require 'flickr'

class StaticPagesController < ApplicationController
  def home

    flickr = Flickr.new(ENV['FLICKR_API_KEY'], ENV['FLICKR_SHARED_SECRET'])
    if params[:id].present?
      begin
        @photos = flickr.photos.search(user_id: params[:id])
      rescue Flickr::FailedResponse => e
        @error = "Failed to retrieve photos: #{e.message}"
      end
    end
  end

end

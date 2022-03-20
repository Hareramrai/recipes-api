# frozen_string_literal: true

class Recipes::DownloaderService < ApplicationService
  def initialize(file_url:)
    @file_url = file_url
  end

  def call
    Zlib::GzipReader.new(file_resource).read
  end

  private

    attr_reader :file_url

    def file_resource
      URI.parse(file_url).open
    end
end

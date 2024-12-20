class Api::UrlsController < ApplicationController
  protect_from_forgery with: :null_session, if: -> { request.format.json? }

  before_action :authenticate_with_token

  def create
    url = Url.new(original_url: params[:original_url])
    if url.save
      render json: { short_url: short_url(url.short_url), original_url: url.original_url }, status: :created
    else
      render json: { error: url.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def authenticate_with_token
    token = request.headers['Authorization']
    unless token && User.exists?(api_token: token)
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def short_url(token)
    "#{request.base_url}/#{token}"
  end
end

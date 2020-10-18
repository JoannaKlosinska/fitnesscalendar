# frozen_string_literal: true

class Coaches::BaseController < ApplicationController
  before_action :authenticate_coach!
end
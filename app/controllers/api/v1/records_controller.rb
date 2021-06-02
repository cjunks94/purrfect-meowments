module Api
  module V1
    class RecordsController < ActionController::Base
      def index
        @records = Record.order('created_at DESC')
      end
    end
  end
end

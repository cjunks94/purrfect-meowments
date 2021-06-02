module Api
  module V1
    class RecordsController < ApiController
      def index
        @records = Record.order('created_at DESC')
      end

      def show
        @record = Record.find(params[:id])
      end

      def create
        @record = Record.new(record_params)
        @record.picture.attach(io: File.open(params[:file_path]), filename: params[:name])

        if @record.save
          render :show
        else
          render json: {errors: @record.errors.messages}, status: :unproccessable_entity
        end
      end

      def destroy
        @record = Record.find(params[:id])
        @record.destroy
      end

      def update
        @record = Record.find(params[:id])
        @record.update(record_params)
        @record.picture.attach(io: File.open(file_params), filename: params[:name]) if params[:file_path]

        if @record.save
          render :show
        else
          render json: {errors: @record.errors.messages}, status: :unproccessable_entity
        end
      end

      private

      def record_params
        params.permit(:name, :description)
      end

      def file_params
        params.permit(:file_path)
      end
    end
  end
end
# @record.picture.attach(io: File.open('/Users/christopherjunker/Downloads/starrynight.jpg'), name: params[:name])

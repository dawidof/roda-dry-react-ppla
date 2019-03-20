# frozen_string_literal: true

require 'web_spec_helper'

RSpec.describe 'Courses', type: :request do
  let(:expected_attributes) { %w[id name createdAt updatedAt] }

  describe 'GET api/v1/courses' do
    context 'without params' do
      subject { get '/api/v1/courses' }

      let!(:course) { create(:course) }

      before { subject }

      it 'returns courses' do
        expect(response.status).to eq 200
        expect(data_hash.count).to eq 1
        expect(data_hash.first).to have_attributes(*expected_attributes.map(&:camel_case_lower))
        expect(data_hash.first).to have_type('course')
      end
    end
  end

  describe 'GET /api/v1/courses/:id' do
    subject { get "/api/v1/courses/#{params[:id]}", params: params }

    let!(:course) { create(:course) }
    let(:params) { { id: course.id } }

    context 'without params' do
      before { subject }

      context 'when record exists' do
        it 'returns course' do
          expect(response.status).to eq 200
          expect(data_hash).to have_id(course.id.to_s)
          expect(data_hash).to have_attributes(*expected_attributes.map(&:camel_case_lower))
          expect(data_hash).to have_type('course')
        end
      end

      context 'when record does not exist' do
        let(:params) { { id: -1 } }

        it 'returns error' do
          expect(response.status).to eq 404
          expect(error).to eq 'Page not found'
        end
      end
    end
  end
end

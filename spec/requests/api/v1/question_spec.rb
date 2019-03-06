# frozen_string_literal: true

require 'web_spec_helper'

RSpec.describe 'Questions', type: :request do
  let(:expected_attributes) { %w[id code title position courseId createdAt updatedAt] }

  describe 'GET api/v1/questions' do
    context 'without params' do
      subject { get '/api/v1/questions' }

      let!(:question) { create(:question) }

      before { subject }

      it 'returns questions' do
        expect(response.status).to eq 200
        expect(data_hash.count).to eq 1
        expect(data_hash.first).to have_attributes(*expected_attributes.map(&:camel_case_lower))
        expect(data_hash.first).to have_type('question')
      end
    end
  end

  describe 'GET /api/v1/questions/:id' do
    subject { get "/api/v1/questions/#{params[:id]}", params: params }

    let!(:question) { create(:question) }
    let(:params) { { id: question.id } }

    context 'without params' do
      before { subject }

      context 'when record exists' do
        it 'returns question' do
          expect(response.status).to eq 200
          expect(data_hash).to have_id(question.id.to_s)
          expect(data_hash).to have_attributes(*expected_attributes.map(&:camel_case_lower))
          expect(data_hash).to have_type('question')
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

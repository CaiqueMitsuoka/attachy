require 'rails_helper'

RSpec.describe Attachy::Viewer, '.attachments' do
  let!(:object) { create :user }

  subject { described_class.new method, object }

  context 'with one file' do
    let!(:method) { :avatar }
    let!(:file)   { create :file, attachable: object, scope: method }

    it 'returns an array' do
      expect(subject.attachments).to eq [file]
    end
  end

  context 'with more than one files' do
    let!(:method) { :photos }
    let!(:file_1) { create :file, attachable: object, scope: method }
    let!(:file_2) { create :file, attachable: object, scope: method }

    it 'returns an array' do
      expect(subject.attachments).to eq [file_1, file_2]
    end
  end
end

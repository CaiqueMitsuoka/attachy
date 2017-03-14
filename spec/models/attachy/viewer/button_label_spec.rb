require 'rails_helper'

RSpec.describe Attachy::Viewer, '.button_label' do
  let!(:method)  { :avatar }
  let!(:object)  { create :user }
  let!(:file)    { create :file, attachable: object }
  let!(:options) { { button: { html: { key: :value } } } }

  subject { described_class.new method, object, options }

  describe 'default options' do
    it 'uses generic button options' do
      el = subject.button_label

      expect(el).to have_tag :span, with: { key: 'value' } do
        with_text '...'
      end
    end
  end

  context 'when :html is present' do
    let!(:html) { { key: 2, text: '---' } }

    it 'merges with default' do
      el = subject.button_label(html: html)

      expect(el).to have_tag :span, with: { key: '2' } do
        with_text '---'
      end
    end
  end
end

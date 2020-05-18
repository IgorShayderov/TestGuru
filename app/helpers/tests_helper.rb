# frozen_string_literal: true

module TestsHelper
  def test_header(test)
    header_part = test.new_record? ?
    I18n.t('create_new') :
    I18n.t('edit')

    "#{header_part} #{I18n.t('activerecord.models.test').downcase}"
  end

  TEST_LEVELS = { 0 => I18n.t('.easy'), 1 => I18n.t('.elementary'), 2 => I18n.t('.advanced'), 3 => I18n.t('.hard')}.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || I18n.t('.hero')
  end
end

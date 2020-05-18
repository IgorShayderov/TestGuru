# frozen_string_literal: true

module BadgesHelper
  def badge_header(badge)
    badge_part = badge.new_record? ?
    I18n.t('create_new') :
    I18n.t('edit')

    "#{badge_part} #{I18n.t('activerecord.models.badge').downcase}"
  end
end

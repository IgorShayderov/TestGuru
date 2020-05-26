# frozen_string_literal: true

module BadgesHelper
  def badge_header(badge)
    badge_part = badge.new_record? ?
    I18n.t('create_new') :
    I18n.t('edit')

    "#{badge_part} #{I18n.t('activerecord.models.badge').downcase}"
  end

  def badge_relation(badge)
    relate_to = BadgeService::RULES[badge.condition.to_sym].relate_to

    if relate_to.class == Array
      badge.condition_param
    else
      relate_to.find(badge.condition_param).title
    end
  end
end

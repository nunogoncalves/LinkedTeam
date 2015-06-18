module ApplicationHelper

  def today?(year, month, day)
    today = DateTime.now
    current_year = today.year
    current_month = today.month
    current_day = today.day
    current_year == year && month == current_month && current_day == day
  end

  def date_with_format(date, format = '%d de %B de %Y')
    I18n.l(date, format: format)
  end

  def month_name(date)
    I18n.l(date, format: "%B")
  end

  def month_number(date)
    date.strftime("%m").to_i
  end


  def first_day(date)
    week_days = %w(SEG TER QUA QUI SEX SAB DOM)
    week_days[date.wday - 1]
  end

end

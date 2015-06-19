class HomePresenter < ViewPresenter

  attr_accessor :date
  attr_reader :params

  def initialize(params)
    @params = params
    @vacations = Vacation.where(year: year)
  end

  def year_view?
    @year_view ||= (params[:show_year] == 'true' || false)
  end

  def date
    return @date if @date.present?

    today = DateTime.now
    year = params[:year].try(:to_i) || today.year
    month = params[:month].try(:to_i) || today.month
    day = today.day

    @date = DateTime.new(year, month, day)
  end

  def year
    date.year
  end

  def previous_year
    date.year - 1
  end

  def next_year
    date.year + 1
  end

  def month
    date.month
  end

  def beggining_of_month(month = nil)
    _month = month || date.month
    @beggining_of_month = DateTime.new(date.year, _month, 1)
  end

  def first_day_of_month_weekday
    beggining_of_month.wday - 1
  end

  def today?(day_of_month)
    today = DateTime.now
    current_year = today.year
    current_month = today.month
    current_day = today.day

    current_year == year && month == current_month && current_day == day_of_month

  end

  def num_days_in_month(month = nil)
    beggining_of_month(month).end_of_month.day
  end

  def num_days_prev_month(month = nil)
    (beggining_of_month(month) - 1.day).day
  end

  def month_num(month = nil)
    month_number(beggining_of_month(month))
  end

  def name_of_month
    I18n.l(date, format: "%B")
  end

  def vacations_in_this_day?(current_day_of_month)
    _d = date_for_vacation_check(current_day_of_month)

    @vacations.each do |vacation|
      if vacation.year == _d.year && vacation.monht == _d.month && vacation.day == _d.day
        return true
      end
    end
    false
  end

  def date_for_vacation_check(current_day_of_month)
    _d = date
    if day_before_beggining_of_month(current_day_of_month)
      _d = date - 1.month
    elsif day_before_beggining_of_month(current_day_of_month)
      _d = date + 1.month
    end

    day = convert_negative_n_of_day_to_previous_month_day(current_day_of_month)
    DateTime.new(_d.year, _d.month, day)
  end

  def vacations_in_day(current_day_of_month)
    _d = date_for_vacation_check(current_day_of_month)
    @vacations.select { |v| v.date == _d }
  end

  def day_not_in_current_month(current_day_of_month)
    day_before_beggining_of_month(current_day_of_month) \
      || day_after_end_of_month(current_day_of_month)
  end

  def day_before_beggining_of_month(current_day_of_month)
    current_day_of_month < 1
  end

  def day_after_end_of_month(current_day_of_month)
    current_day_of_month > num_days_in_month
  end

  def convert_negative_n_of_day_to_previous_month_day(current_day_of_month)
    if day_after_end_of_month(current_day_of_month)
      return current_day_of_month - num_days_in_month
    elsif day_before_beggining_of_month(current_day_of_month)
      return num_days_prev_month - (-current_day_of_month)
    end
    return current_day_of_month
  end
end
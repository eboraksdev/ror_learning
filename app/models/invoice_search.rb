class InvoiceSearch
  attr_reader :date_from, :date_to

  def initialize(params)
    params ||={}
    @date_from = parse_date(params[:date_from], 7.days.ago.to_date.to_s)
    @date_to = parse_date(params[:date_to], Date.today.to_s)
  end

  def scope
    Invoice.where("date >= ? and date <= ?", @date_from, @date_to)
  end

  private

  def parse_date(date_s, default)
    Date.parse(date_s)
  rescue ArgumentError, TypeError
    default
  end

end
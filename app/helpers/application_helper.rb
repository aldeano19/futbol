module ApplicationHelper
  def dateFormatOne(datetime)
    datetime.strftime("%m/%d/%Y")
  end

  def dateFormatTwo(datetime)
    datetime.strftime("%A, %d %b %Y %l:%M %p")
  end
end

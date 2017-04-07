module DateUtils

# ARTICLES
#  - http://old.sevierriver.org/et/t110.html
#
#

export date2julian,
    julian_year;

@doc """
Date to Julian Day converter
"""
date2julian(date::Date) = Dates.datetime2julian(convert(DateTime, date))
date2julian(date::Date, since::Date) = Int(date2julian(date) - date2julian(since))

@doc """
Julian Day Of Year
Date to Julian Day converter
"""
julian_year(date::Date) = date2julian(date, Date(Dates.year(date)))

end # module

__precompile__()

module SolarSystemLib

include("DateUtils.jl")

export eccfaccor

# ARTICLES
#  - http://old.sevierriver.org/et/t110.html
#
#

@doc """
Correction of eccentricity factor
"""
eccfaccor(julia_year::Int) = 1+(0.033*cos(180/pi*julia_year/365))
eccfaccor(date::Date) = eccfaccor(DateUtils.julian_year(date))

#@doc """
#
#References:
#    - http://www.ufvjm.edu.br/disciplinas/agr049/files/2014/04/RADIA%C3%87%C3%83O-SOLAR-E-TERRESTRE-1-2-2014-.pdf
#
#"""

end # module

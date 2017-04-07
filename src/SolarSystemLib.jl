__precompile__()

module SolarSystemLib

include("DateUtils.jl")

export eccfaccor,
    declination,
    sunsethourlyangle,
    middayhour,
    sunsethour,
    sunrisehour

# ARTICLES
#  - http://old.sevierriver.org/et/t110.html
#
#

@doc """
Correction of eccentricity factor
"""
eccfaccor(julia_year::Signed) = 1+(0.033*cos(180/pi*julia_year/365))
eccfaccor(date::Date) = eccfaccor(DateUtils.julian_year(date))


@doc """
Solar Declination
"""
declination(julian_year::Signed) = 23.45 * pi / 180 * (sin((2 * pi / 365) * (julian_year - 80)))
declination(date::Date) = declination(DateUtils.julian_year(date))


@doc """

"""
sunsethourlyangle(lat_rad::AbstractFloat, declination::AbstractFloat) = acos(-tan(lat_rad) * tan(declination))


@doc """
Middle Day Hour
"""
middayhour(hourly_angle::AbstractFloat) = hourly_angle * (180 / pi / 15)


@doc """
Sunset hour
"""
sunsethour(hourly_angle::AbstractFloat) = middayhour(hourly_angle) + 12


@doc """
Sunrise hour
"""
sunrisehour(hourly_angle::AbstractFloat) = 12 - middayhour(hourly_angle)

#@doc """
#
#References:
#    - http://www.ufvjm.edu.br/disciplinas/agr049/files/2014/04/RADIA%C3%87%C3%83O-SOLAR-E-TERRESTRE-1-2-2014-.pdf
#
#"""

end # module

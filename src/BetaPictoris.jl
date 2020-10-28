BetaPictoris_desc = """
# Beta Pictoris NaCo ADI Data

Website: https://github.com/carlgogo/exoimaging_challenge_extras

Author: Carlos Gomez-Gonzalez

License: MIT


## Keys
* `:cube` pre-processed ADI cube
* `:pa` parallactic angles
* `:psf` off-axis PSF
"""

BetaPictoris_datadep = DataDep(
    "BetaPictoris",
    BetaPictoris_desc,
    [
        "https://github.com/carlgogo/exoimaging_challenge_extras/raw/master/naco_betapic_cube.fits",
        "https://github.com/carlgogo/exoimaging_challenge_extras/raw/master/naco_betapic_pa.fits",
        "https://github.com/carlgogo/exoimaging_challenge_extras/raw/master/naco_betapic_psf.fits"
    ],
    "b3e72407cab3a4929f2b1ad24107bcc6b90c618fb85d00152c4710b81fcac579"
)


@doc BetaPictoris_desc
struct BetaPictoris end

Base.keys(::Type{BetaPictoris}) = (:cube, :pa)

function Base.getindex(::Type{BetaPictoris}, key::Symbol)
    if key === :cube
        getdata(datadep"BetaPictoris/naco_betapic_cube.fits")
    elseif key === :pa
        getdata(datadep"BetaPictoris/naco_betapic_pa.fits")
    elseif key === :psf
        getdata(datadep"BetaPictoris/naco_betapic_psf.fits")
    else
        KeyError(key)
    end
end

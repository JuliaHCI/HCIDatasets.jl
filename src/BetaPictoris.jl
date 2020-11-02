using DataDeps: fetch_default

BetaPictoris_desc = """
# Beta Pictoris NaCo ADI Data

Websites
* https://github.com/carlgogo/VIP_extras
* https://github.com/carlgogo/exoimaging_challenge_extras

Author: Carlos Gomez-Gonzalez

License: MIT


## Keys
* `:cube` pre-processed ADI cube
* `:cube_empty` pre-processed ADI cube with companion (Beta Pictoris b) removed
* `:pa` parallactic angles
* `:psf` off-axis PSF
"""

BetaPictoris_datadep = DataDep(
    "BetaPictoris",
    BetaPictoris_desc,
    [
        "https://rawcdn.githack.com/carlgogo/VIP_extras/a7ec7ac9aeabcb5df73b9ea57270c6d66f9e3f57/datasets/naco_betapic_cube.fits",
        "https://rawcdn.githack.com/carlgogo/exoimaging_challenge_extras/8f46c1a3b56842722b87c86fd32f5b0dba9beaf0/naco_betapic_cube.fits",
        "https://rawcdn.githack.com/carlgogo/VIP_extras/a7ec7ac9aeabcb5df73b9ea57270c6d66f9e3f57/datasets/naco_betapic_pa.fits",
        "https://rawcdn.githack.com/carlgogo/VIP_extras/a7ec7ac9aeabcb5df73b9ea57270c6d66f9e3f57/datasets/naco_betapic_psf.fits"
    ],
    "437e2004ba8737cb3fc2a83330d12f86adf659ad74c1daf52a8e073c0b7619cd";
    fetch_method = [
        fetch_default,
        # use a custom method that directly downloads to our chosen file-name
        (remote_path, localdir) -> DataDeps.HTTP.download(remote_path, joinpath(localdir, "naco_betapic_cube_empty.fits")),
        fetch_default,
        fetch_default
    ]
)


@doc BetaPictoris_desc
struct BetaPictoris end

Base.keys(::Type{BetaPictoris}) = (:cube, :pa, :psf, :cube_empty)

function Base.getindex(::Type{BetaPictoris}, key::Symbol)
    if key === :cube
        getdata(datadep"BetaPictoris/naco_betapic_cube.fits")
    elseif key === :cube_empty
        getdata(datadep"BetaPictoris/naco_betapic_cube_empty.fits")
    elseif key === :pa
        getdata(datadep"BetaPictoris/naco_betapic_pa.fits")
    elseif key === :psf
        getdata(datadep"BetaPictoris/naco_betapic_psf.fits")
    else
        KeyError(key)
    end
end

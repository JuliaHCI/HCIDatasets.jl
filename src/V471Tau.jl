V471Tau_desc = """
# V471 Tau SPHERE SDI Data

Website: https://github.com/carlgogo/VIP_extras

Author: Carlos Gomez-Gonzalez

## Keys
* `:cube` pre-processed SDI tensor/cube
* `:pa` parallactic angles
* `:wl` wavelengths
* `:psf` off-axis PSF
"""

V471Tau_datadep = DataDep(
    "V471Tau",
    V471Tau_desc,
    [
        "https://rawcdn.githack.com/carlgogo/VIP_extras/a7ec7ac9aeabcb5df73b9ea57270c6d66f9e3f57/datasets/sphere_v471tau_cube.fits",
        "https://rawcdn.githack.com/carlgogo/VIP_extras/a7ec7ac9aeabcb5df73b9ea57270c6d66f9e3f57/datasets/sphere_v471tau_pa.fits",
        "https://rawcdn.githack.com/carlgogo/VIP_extras/a7ec7ac9aeabcb5df73b9ea57270c6d66f9e3f57/datasets/sphere_v471tau_psf.fits",
        "https://rawcdn.githack.com/carlgogo/VIP_extras/a7ec7ac9aeabcb5df73b9ea57270c6d66f9e3f57/datasets/sphere_v471tau_wl.fits"
    ],
    "e6c93b47c401a3747df646abb8311fe9ed3ae128c5a415c8831d6075cf642eee"
)


struct V471TauDataset <: HCIDataset end

@doc V471Tau_desc
const V471Tau = V471TauDataset()

Base.keys(::V471TauDataset) = (:cube, :pa, :psf, :wl)

function Base.getindex(::V471TauDataset, key::Symbol)
    if key === :cube
        getdata(datadep"V471Tau/sphere_v471tau_cube.fits")
    elseif key === :pa
        getdata(datadep"V471Tau/sphere_v471tau_pa.fits")
    elseif key === :psf
        getdata(datadep"V471Tau/sphere_v471tau_psf.fits")
    elseif key === :wl
        getdata(datadep"V471Tau/sphere_v471tau_wl.fits")
    else
        throw(KeyError(key))
    end
end


HR8799_desc = """
# HR8799 NIRC2/Vortex ADI Data

Website: https://doi.org/10.5281/zenodo.4142348

Author: Michael Bottom et al.

Date of Publication: October 27, 2020

License: https://creativecommons.org/licenses/by/4.0/legalcode

Processed data for HR8799 captured using Keck II's NIRC2 with the Vortex Coronagraph. The data was processed in preparation for a journal article and is further described on this page.

Please cite this dataset: Bottom, M., Mawet, D., and Ruane, G. (2020). *HR8799 NIRC2/Vortex Processed Data* [Data set]. Zenodo. https://doi.org/10.5281/ZENODO.4142348

## Keys
* `:cube` pre-processed ADI cube
* `:pa` parallactic angles
"""

HR8799_datadep = DataDep(
    "HR8799",
    HR8799_desc,
    [
        "https://zenodo.org/record/4142349/files/HR8799_cube.fits?download=1",
        "https://zenodo.org/record/4142349/files/HR8799_pa.fits?download=1"
    ],
    "950102a5133eaf08c9e7b15033f570df2eea968ab3db5e20e3ea6243708fb193"
)


@doc HR8799_desc
struct HR8799 end

Base.keys(::Type{HR8799}) = (:cube, :pa)

function Base.getindex(::Type{HR8799}, key::Symbol)
    if key === :cube
        getdata(datadep"HR8799/HR8799_cube.fits")
    elseif key === :pa
        getdata(datadep"HR8799/HR8799_pa.fits")
    else
        throw(KeyError(key))
    end
end

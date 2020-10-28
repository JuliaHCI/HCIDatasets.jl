module HCIDatasets

using FITSIO
using DataDeps

# helper for loading data with FITSIO.jl
function getdata(path)
    raw_data = read(FITS(path)[1])
    return permutedims(raw_data, reverse(1:ndims(raw_data)))
end

include("HR8799.jl")

function __init__()
    register(HR8799_datadep)
end

end

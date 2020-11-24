module HCIDatasets

using DataDeps
using FITSIO

# helper for loading data with FITSIO.jl
function getdata(path)
    raw_data = read(FITS(path)[1])
    return permutedims(raw_data, reverse(1:ndims(raw_data)))
end

# setup type system
abstract type HCIDataset end

Base.getindex(d::HCIDataset, keys...) = map(k -> d[k], keys)
Base.getindex(d::HCIDataset, keys) = map(k -> d[k], keys)
Base.pairs(d::HCIDataset) = (k => d[k] for k in keys(d))

include("HR8799.jl")
include("BetaPictoris.jl")
include("V471Tau.jl")

function __init__()
    register(HR8799_datadep)
    register(BetaPictoris_datadep)
    register(V471Tau_datadep)
end

end

module HCIDatasets

using DataDeps
using FITSIO

# helper for loading data with FITSIO.jl
function getdata(path)
    raw_data = read(FITS(path)[1])
    return permutedims(raw_data, reverse(1:ndims(raw_data)))
end

include("HR8799.jl")
include("BetaPictoris.jl")
include("V471Tau.jl")

# use code gen for common methods to avoid type piracy
# see https://github.com/JuliaHCI/HCIDatasets.jl/issue/
for DSET in (BetaPictoris, HR8799, V471Tau)
    Base.getindex(d::Type{DSET}, keys...) = map(k -> d[k], keys)
    Base.getindex(d::Type{DSET}, keys) = map(k -> d[k], keys)
    Base.pairs(d::Type{DSET}) = (k => d[k] for k in keys(d))
end

function __init__()
    register(HR8799_datadep)
    register(BetaPictoris_datadep)
    register(V471Tau_datadep)
end

end

using HCIDatasets
using HCIDatasets: BetaPictoris, HR8799, V471Tau
using Test

macro HCIDatasetTestset(dataset, keys, sizes, T=Float32)
    quote
        @testset $(string(dataset)) begin
            @test keys($dataset) == $keys
            @test $dataset[$keys] == $dataset[$keys...]
            for ((k, arr), key, sz) in zip(pairs($dataset), $keys, $sizes)
                @test k == key
                @test $dataset[key] == arr
                @test size(arr) == sz
                @test eltype(arr) == $T
            end
        end
    end
end

@HCIDatasetTestset BetaPictoris (:cube, :cube_empty, :pa, :psf) [(101, 101, 61), (101, 101, 61), (61,), (39, 39)]
@HCIDatasetTestset HR8799 (:cube, :pa) [(501, 501, 74), (74,)]
@HCIDatasetTestset V471Tau (:cube, :pa, :psf, :wl) [(132, 132, 24, 39), (24,), (25, 25, 39), (39,)]

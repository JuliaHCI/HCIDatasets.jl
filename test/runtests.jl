using HCIDatasets
using HCIDatasets: BetaPictoris, HR8799, V471Tau
using Test

    
@testset "BetaPictoris" begin
    @test keys(BetaPictoris) == (:cube, :cube_empty, :pa, :psf)

    cube, cube_empty, pa, psf = BetaPictoris[keys(BetaPictoris)]

    # data loads correct shape
    @test size(cube) == (61, 101, 101)
    @test size(cube_empty) == (61, 101, 101)
    @test size(pa) == (61,)
    @test size(psf) == (39, 39)

    # eltypes
    for d in (cube, cube_empty, pa, psf)
        @test eltype(d) == Float32
    end
end

@testset "HR8799" begin
    @test keys(HR8799) == (:cube, :pa)

    cube, pa = HR8799[keys(HR8799)]

    # data loads correct shape
    @test size(cube) == (74, 501, 501)
    @test size(pa) == (74,)

    # eltypes
    for d in (cube, pa)
        @test eltype(d) == Float32
    end
end

@testset "V471Tau" begin
    @test keys(V471Tau) == (:cube, :pa, :psf, :wl)

    cube, pa, psf, wl = V471Tau[keys(V471Tau)]

    # data loads correct shape
    @test size(cube) == (39, 24, 132, 132)
    @test size(pa) == (24,)
    @test size(psf) == (39, 25, 25)
    @test size(wl) == (39,)

    # eltypes
    for d in (cube, pa, psf, wl)
        @test eltype(d) == Float32
    end
end

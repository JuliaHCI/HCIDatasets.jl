# HCIDatasets.jl

[![Build Status](https://github.com/juliahci/HCIDatasets.jl/workflows/CI/badge.svg?branch=master)](https://github.com/juliahci/HCIDatasets.jl/actions)
[![PkgEval](https://juliaci.github.io/NanosoldierReports/pkgeval_badges/H/HCIDatasets.svg)](https://juliaci.github.io/NanosoldierReports/pkgeval_badges/report.html)
[![Coverage](https://codecov.io/gh/juliahci/HCIDatasets.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/juliahci/HCIDatasets.jl)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This repository provides a common location for high-contrast imaging datasets in an easy-to-consume interface.

## Datasets

The following datasets are provided:

* `HR8799` - HR8799 taken with NIRC2/Vortex Coronagraph
* `BetaPictoris` - Beta Pictoris taken with NaCo
* `V471Tau` - V 471 Tau IFS data cube taken with VLT/SPHERE

## Usage

For the datasets provided, take a look at their docstrings to see a description and the available fields, for example

```julia
julia> ?HCIDatasets.HR8799
```

or directly query using `keys`

```julia
julia> keys(HCIDatasets.HR8799)
(:cube, :pa)
```

We can load the ADI cube and parallactic angles in this instance, just like a dictionary

```julia
julia> cube = HCIDatasets.HR8799[:cube]

julia> cube, angles = HCIDatasets.BetaPictoris[:cube, :pa]
```

and we can get the keys or iterate over the pairs
```julia
julia> using HCIDatasets: HR8799

julia> keys(HR8799)
(:cube, :pa)

julia> pairs(HR8799) |> collect
(:cube => Float32[ ... ],
 :pa => Float32[ ... ])
```

## Data Dependencies

The datasets provided here are supplied via [DataDeps.jl](https://github.com/oxinabox/DataDeps.jl). The first time you try accessing a dataset you will prompted to download the necessary files. For more information about options for where this data is saved and how it is loaded, see [the documentation](https://www.oxinabox.net/DataDeps.jl/stable/z10-for-end-users/).

Note: for package writers using this for testing with CI- DataDeps.jl can be set to automatically download via the environment variable `DATADEPS_ALWAYS_ACCEPT=true`, which will need to be set in your CI environment.

## Adding a Dataset

If you would like to add a dataset, please upload it to zenodo and then file a [pull request](https://github.com/JuliaHCI/HCIDatasets.jl/pulls) with the corresponding code additions. The code behind HCIDatasets.jl is very simple: browse the `HR8799.jl` file to get an idea of the process.

## License

The code is under an MIT license (see [LICENSE](LICENSE)). Each dataset may have its own license or citations. Please provide attribution for the original data providers when making use of their data!

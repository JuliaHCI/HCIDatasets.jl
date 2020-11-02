# HCIDatasets.jl

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
julia> HCIDatasets.HR8799[:cube]
```

## Data Dependencies

The datasets provided here are supplied via [DataDeps.jl](https://github.com/oxinabox/DataDeps.jl). The first time you try accessing a dataset you will prompted to download the necessary files. For more information about options for where this data is saved and how it is loaded, see [the documentation](https://www.oxinabox.net/DataDeps.jl/stable/z10-for-end-users/).

Note: for package writers using this for testing with CI- DataDeps.jl can be set to automatically download via the environment variable `DATADEPS_ALWAYS_ACCEPT=true`, which will need to be set in your CI environment.

## Adding a Dataset

If you would like to add a dataset, please upload it to zenodo and then file a [pull request](https://github.com/JuliaHCI/HCIDatasets.jl/pulls) with the corresponding code additions. The code behind HCIDatasets.jl is very simple: browse the `HR8799.jl` file to get an idea of the process.
